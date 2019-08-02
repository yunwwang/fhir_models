module FHIR
  module Validation
    module FixedValueValidator

      # Validate the element matches the fixed value if a fixed value is provided
      #
      # @param element [Object] The Element of the Resource under test
      # @param element_definition [FHIR::ElementDefinition] The Element Definition from which the cardinality is taken
      # @return result [FHIR::ValidationResult] The result of the cardinality check
      def validate(resource, element_definition, current_path = nil)
        fixed = element_definition.fixed
        return unless fixed.respond_to?(:empty?) ? fixed.empty? : fixed.nil?

        elements = retrieve_by_element_definition(resource, element_definition, indexed: true)

        result = FHIR::ValidationResult.new
        result.element_definition = element_definition
        result.validation_type = :fixed_value
        result.element = element

        result.result = (element == fixed)
        result
      end

      module_function :validate
    end
  end
end