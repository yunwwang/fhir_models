module FHIR
  module Validation
    module FixedValueValidator

      # Validate the element matches the fixed value if a fixed value is provided
      #
      # @param element [Object] The Element of the Resource under test
      # @param element_definition [FHIR::ElementDefinition] The Element Definition from which the cardinality is taken
      # @return result [FHIR::ValidationResult] The result of the cardinality check
      def validate(element, element_definition, current_path = nil)
        fixed = element_definition.fixed
        return unless fixed.respond_to?(:empty?) ? fixed.empty? : fixed.nil?

        result = FHIR::ValidationResult.new
        result.element_definition = element_definition
        result.validation_type = :fixed_value
        result.element = element

        result.is_successful = (element == fixed)
        result
      end

      module_function :validate
    end
  end
end