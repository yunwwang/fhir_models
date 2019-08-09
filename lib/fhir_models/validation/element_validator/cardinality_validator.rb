module FHIR
  module Validation
    # Validator which allows cardinality validation of an element against an ElementDefinition
    module CardinalityValidator
      # Verify that the element meets the cardinality requirements
      #
      # @param element [Object] The Element of the Resource under test
      # @param element_definition [FHIR::ElementDefinition] The Element Definition from which the cardinality is taken
      # @return result [FHIR::ValidationResult] The result of the cardinality check
      def self.validate(resource, element_definition)
        # Cardinality has no meaning on the first element.
        # It is listed as optional(irrelevant)
        # Specification Reference: http://www.hl7.org/fhir/elementdefinition.html#interpretation
        # Zulip Chat: https://chat.fhir.org/#narrow/stream/179166-implementers/topic/cardinality.20of.20root.20elements/near/154024550
        return unless element_definition.path.include? '.'

        elements = resource.retrieve_elements_by_definition(element_definition, normalized: true)
        elements.flat_map do |path, el|
          el = [el].flatten.compact
          validate_element(el, element_definition, path)
        end
      end

      def self.validate_element(elements, element_definition, path)
        min = element_definition.min
        max = element_definition.max == '*' ? Float::INFINITY : element_definition.max.to_i
        cardinality_check = ((elements.length < min) || (elements.length > max))
        FHIR::ValidationResult.new(element_definition: element_definition,
                                   validation_type: :cardinality,
                                   element_path: path,
                                   element: elements,
                                   result: cardinality_check ? :fail : :pass)
      end
    end
  end
end
