module FHIR
  module Validation
    # Validator which allows Data Type validation of an element against an ElementDefinition
    module DataTypeValidator
      # FHIR Resources, Profiles and the StructureDefinitions are made up of FHIR Data Types.
      # There are two kinds of structures that fall under the FHIR Data Types: complex-type and primitive-type.
      # The snapshot of a resource does not contain the element definitions associated with primitive-type or complex-type
      # structures it is composed of.
      #
      # https://www.hl7.org/fhir/datatypes.html
      # @param element [Object] The Element of the Resource under test
      # @param element_definition [FHIR::ElementDefinition] The Element Definition from which the cardinality is taken
      # @return result [FHIR::ValidationResult] The result of the cardinality check
      def self.validate(resource, element_definition)
        return unless element_definition.path.include? '.' # Root Elements do not have a type

        return if element_definition.type.empty?

        elements = resource.retrieve_elements_by_definition(element_definition, indexed: true)

        elements.flat_map do |path, el|
          validate_element(el, element_definition, path)
        end
      end

      def self.validate_element(element, element_definition, path)
        # Get the type
        begin
          type_code = element_definition.type_code(path)
        rescue FHIR::UnknownType
          type_code = nil
        end
        type_def = FHIR::Definitions.definition(type_code)

        # If we are missing the Structure Definition needed to do the validation.
        if type_def.nil?
          result_text = if type_code.nil?
                          'Type code not provided or extends the primitive code'
                        else
                          "Unknown type: #{type_code}"
                        end
          return FHIR::ValidationResult.new(element_definition: element_definition,
                                            validation_type: :datatype,
                                            result: :warn,
                                            text: result_text,
                                            element_path: path || element_definition.path)
        elsif type_def.kind == 'primitive-type'
          return FHIR::ValidationResult.new(element_definition: element_definition,
                                            validation_type: :datatype,
                                            result: :warn,
                                            text: 'Cannot validate primitive-type as a Structure',
                                            element_path: path || element_definition.path)
        end
        type_validator = FHIR::Validation::StructureValidator.new(type_def)
        type_validator.register_element_validators(FHIR::Validation::CardinalityValidator)
        results = type_validator.validate(element)

        # Update the path to reflect the object it is nested within
        results.map do |res|
          res.element_path = res.element_path.gsub(/^([^.]+)/, path)
          res
        end
      end
    end
  end
end
