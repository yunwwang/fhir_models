module FHIR
  module Validation
    # Validator which allows cardinality validation of an element against an ElementDefinition
    module CardinalityValidator

      # Verify that the element meets the cardinality requirements
      #
      # @param element [Object] The Element of the Resource under test
      # @param element_definition [FHIR::ElementDefinition] The Element Definition from which the cardinality is taken
      # @return result [FHIR::ValidationResult] The result of the cardinality check
      def validate(element, element_definition, current_path = nil)
        # Cardinality has no meaning on the first element.
        # It is listed as optional(irrelevant)
        # Specification Reference: http://www.hl7.org/fhir/elementdefinition.html#interpretation
        # Zulip Chat: https://chat.fhir.org/#narrow/stream/179166-implementers/topic/cardinality.20of.20root.20elements/near/154024550
        return unless element_definition.path.include? '.'

        min = element_definition.min
        max = element_definition.max == '*' ? Float::INFINITY : element_definition.max.to_i
        result = FHIR::ValidationResult.new
        # Save a reference to the ElementDefinition
        result.element_definition = element_definition
        result.validation_type = :cardinality
        result.element_path = current_path || element_definition.path
        result.element = element
        element_array = [element].flatten.compact
        result.is_successful = !((element_array.size < min) || (element_array.size > max))
        result
      end

      module_function :validate
    end
  end
end
