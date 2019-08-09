module FHIR
  module Validation
    # Validate Terminology in coded elements
    class TerminologyValidator
      attr_reader :vs_validators
      def initialize(validators = {})
        @vs_validators = validators
      end

      # Method for registering ValueSet and CodeSystem Validators
      #
      # @param valueset_uri [String] The ValueSet URI the validator is related to
      # @param validator [#validate] The validator
      def register_vs_validator(valueset_uri, validator)
        @vs_validators[valueset_uri] = validator
      end

      # Clear the registered ValueSet and CodeSystem Validators
      def clear_vs_validators
        @vs_validators = {}
      end

      # Verify that the element meets terminology requirements
      #
      # @param resource [FHIR::Model] The resource under test
      # @param element_definition [FHIR::ElementDefinition] The Element Definition for the elements
      # @return result [Array<FHIR::ValidationResult>] The result of the terminology check
      def validate(resource, element_definition)
        elements = resource.retrieve_elements_by_definition(element_definition, indexed: true)
        elements.flat_map do |path, el|
          validate_element(el, element_definition, path)
        end
      end


      # Validates a single element against the ElementDefinition
      #
      # @param element [] the element to be validated
      # @param element_definition [FHIR::ElementDefinition] the ElementDefinition which defines the element
      # @param path [String] where the element is located in the parent resource
      # @return result [Array<FHIR::ValidationResult>] the result of the data type validation
      def validate_element(element, element_definition, path)
        results = []
        # Get the type
        type_code = element_definition.type_code(path)

        if %w[CodeableConcept Coding Quantity].include? type_code
          required_strength = element_definition&.binding&.strength == 'required'

          result = lambda do |result_status, message|
            FHIR::ValidationResult.new(element_definition: element_definition,
                                       validation_type: :terminology,
                                       element_path: path,
                                       element: element,
                                       text: message,
                                       result: result_status)
          end

          valueset_uri = element_definition&.binding&.valueSet

          check_code = lambda do |coding, fail_strength|
            # Can't validate if both code and system are not given
            if coding.code.nil? || coding.system.nil?
              results.push(result.call(:warn, "#{path}: missing code")) if coding.code.nil?
              results.push(result.call(:warn, "#{path}: missing system")) if coding.system.nil?
              return results
            end

            check = lambda do |uri, fail_level|
              check_fn = @vs_validators[uri]
              return result.call(:warn, "Missing Validator for #{uri}") unless check_fn

              return result.call(fail_level, "#{path} has no codings from #{uri}.") unless check_fn.call(coding)

              return result.call(:pass, "#{path} has codings from #{uri}.")
            end

            # ValueSet Validation
            results.push(check.call(valueset_uri, fail_strength))
            # Code System Validation
            results.push(check.call(coding.system, :fail))
          end

          if type_code == 'CodeableConcept'
            element.coding.each do |coding|
              check_code.call(coding, required_strength ? :fail : :warn)
            end
          else
            # avoid checking Codings twice if they are already checked as part of a CodeableConcept
            # The CodeableConcept should contain the binding for the children Codings
            check_code.call(element, required_strength ? :fail : :warn) unless element_definition.path.include? 'CodeableConcept.coding'
          end
        end
        results
      end
    end
  end
end
