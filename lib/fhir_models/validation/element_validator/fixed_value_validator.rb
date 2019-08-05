module FHIR
  module Validation
    # Validate that an element equals the fixed value defined in the ElementDefinition
    module FixedValueValidator
      # Validate the element matches the fixed value if a fixed value is provided
      #
      # @param element [Object] The Element of the Resource under test
      # @param element_definition [FHIR::ElementDefinition] The Element Definition from which the cardinality is taken
      # @return result [FHIR::ValidationResult] The result of the cardinality check
      def self.validate(resource, element_definition)
        fixed = element_definition.fixed
        return if fixed.respond_to?(:empty?) ? fixed.empty? : fixed.nil?

        elements = Retrieval.retrieve_by_element_definition(resource,
                                                            element_definition,
                                                            indexed: true)

        elements.flat_map do |path, el|
          validate_element(el, element_definition, path)
        end
      end

      def self.validate_element(element, element_definition, path)
        result = FHIR::ValidationResult.new
        result.element_definition = element_definition
        result.validation_type = :fixed_value
        result.element = element
        result.element_path = path

        result.result = element == element_definition.fixed ? :pass : :fail
        result
      end
    end
  end
end
