module FHIR
  # Element Validators accept an ElementDefinition and the associated element of the resource being validated.
  module ElementValidator
    # Verify that the element meets the cardinality requirements
    #
    # @param element [Object] The Element of the Resource under test
    # @param element_definition [FHIR::ElementDefinition] The Element Definition from which the cardinality is taken
    # @return result [FHIR::ValidationResult] The result of the cardinality check
    def self.verify_element_cardinality(element, element_definition, current_path, skip = false)
      min = element_definition.min
      max = element_definition.max == '*' ? Float::INFINITY : element_definition.max.to_i
      result = FHIR::ValidationResult.new
      # Save a reference to the ElementDefinition
      result.element_definition = element_definition
      result.validation_type = :cardinality

      # Cardinality has no meaning on the first element.
      # It is listed as optional(irrelevant)
      # Specification Reference: http://www.hl7.org/fhir/elementdefinition.html#interpretation
      # Zulip Chat: https://chat.fhir.org/#narrow/stream/179166-implementers/topic/cardinality.20of.20root.20elements/near/154024550
      if skip || !current_path.include?('.')
        result.is_successful = :skipped
        result.element_path = current_path || element_definition.path
        return result
      end
      result.element_path = current_path
      result.element = element
      element_array = [element].flatten.compact # flatten
      result.is_successful = !((element_array.size < min) || (element_array.size > max))
      result
    end

    # Verify the individual FHIR Data Types
    #
    # FHIR Resources, Profiles and the StructureDefinitions are made up of FHIR Data Types.
    # There are two kinds of structures that fall under the FHIR Data Types: complex-type and primitive-type.
    # The snapshot of a resource does not contain the element definitions associated with primitive-type or complex-type
    # structures it is composed of.
    #
    # This test validates
    #
    # https://www.hl7.org/fhir/datatypes.html
    def self.verify_data_type(element, element_definition, current_path, skip = false)
      # TODO: Need to update element path to reflect that they are nested in a parent
      if skip || element_definition.type.empty? # Root Elements do not have a type
        result = FHIR::ValidationResult.new
        result.element_definition = element_definition
        result.validation_type = :datatype
        result.is_successful = :skipped
        result.element_path = current_path || element_definition.path
        return result
      end

      # Get the type
      type_code = if element_definition.type.one?
                    element_definition.type.first.code
                  else
                    element_definition.type.find do |datatype|
                      /[^.]+$/.match(element_definition.path.gsub('[x]', datatype.code.capitalize)) == /[^.]+$/.match(current_path)
                    end
                  end
      type_def = FHIR::Definitions.type_definition(type_code) || FHIR::Definitions.resource_definition(type_code)
      if type_def.nil?
        result = FHIR::ValidationResult.new
        result.element_definition = element_definition
        result.validation_type = :datatype
        result.is_successful = :skipped
        result.element_path = current_path || element_definition.path
        return result
      end
      type_validator = FHIR::ProfileValidator.new(type_def)
      results = type_validator.validate(element)

      results.each { |res| res.element_path = res.element_path.gsub(/^([^.]+)/, current_path) }
    end

    # Error for Unknown Types
    class UnknownType < StandardError
      def initialize(msg = "Unknown TypeCode")
        super(msg)
      end
    end
  end
end
