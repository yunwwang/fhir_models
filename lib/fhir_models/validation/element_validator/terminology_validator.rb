module FHIR
  module Validation
    class TerminologyValidator
      def initialize(validators)
        @vs_validators = validators
      end

      # Method for registering ValueSet and CodeSystem Validators
      #
      # @param valueset_uri [String] The ValueSet URI the validator is related to
      # @param validator [#validate] The validator
      def register_vs_validator(valueset_uri, validator)
        @vs_validators[valueset_uri] = validator
      end

      # Verify that the element meets terminology requirements
      #
      # @param element [Object] The Element of the Resource under test
      # @param element_definition [FHIR::ElementDefinition] The Element Definition for the elements
      # @return result [FHIR::ValidationResult] The result of the terminology check
      def validate(resource, element_definition)
        elements = FHIR::Validation::Retrieval.retrieve_by_element_definition(resource,
                                                                              element_definition,
                                                                              indexed: true)
        elements.flat_map do |path, el|
          validate_element(el, element_definition, path)
        end
      end

      def validate_element(element, element_definition, path)
        # Get the type
        type_code = if element_definition.type.one?
                      element_definition.type.first.code
                    else
                      return UnknownType.new('Need path in order to determine type') unless path

                      element_definition.type.find do |datatype|
                        cap_code = "#{datatype.code[0].capitalize}#{datatype.code[1..-1]}"
                        /[^.]+$/.match(element_definition.path.gsub('[x]', cap_code)) == /[^.]+$/.match(path)
                      end.code
                    end

        if ['CodeableConcept', 'Coding', 'Quantity'].include? type_code
          required_strength = element_definition&.binding&.strength == 'required'
          binding_issues = []
          fail_strength = required_strength ? false : :warn

          result = FHIR::ValidationResult.new(element_definition: element_definition,
                                              validation_type: :terminology,
                                              element_path: path,
                                              element: element)

          valueset_uri = element_definition&.binding&.valueSet

          check_code = ->coding do
            # Can't validate if both code and system are not given
            if coding.code.nil? || coding.system.nil?
              binding_issues << "#{path}: #{coding.to_json} missing code" if coding.code.nil?
              binding_issues << "#{path}: #{coding.to_json} missing system" if coding.system.nil?
              return
            end

            # ValueSet Validation
            check_fn = @vs_validators[valueset_uri]
            has_valid_code = false
            if check_fn
              has_valid_code = check_fn.call(coding)
              binding_issues << "#{path} has no codings from #{valueset_uri}. Codings evaluated: #{coding.to_json}" unless has_valid_code
            else
              binding_issues << "Missing ValueSet Validator for #{valueset_uri}"
              result.is_successful = :warn
            end

            # CodeSystem Validation
            unless has_valid_code
              check_fn = @vs_validators[coding.system]
              if check_fn && !check_fn.call(coding)
                binding_issues << "#{path} has no codings from it's specified system: #{coding.system}.  "\
                                      "Codings evaluated: #{coding.to_json}"
              end
            end
          end

          if type_code == 'CodeableConcept'
            element.coding.each do |coding|
              check_code.(coding)
            end
          else
            # avoid checking Codings twice if they are already checked as part of a CodeableConcept
            # The CodeableConcept should contain the binding for the children Codings
            check_code.(element) unless element_definition.path.include? 'CodeableConcept.coding'
          end
          result.text = binding_issues

          result.is_successful ||= binding_issues.empty? || fail_strength
          result
        end
      end
    end
  end
end