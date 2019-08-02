module FHIR
  # A result return by a validator
  class ValidationResult
    attr_accessor :element
    attr_accessor :element_definition
    attr_accessor :result
    attr_accessor :validation_type
    attr_accessor :element_definition_id
    attr_accessor :element_path
    attr_accessor :profile
    attr_accessor :text

    def initialize(element: nil, element_definition: nil, element_path: nil, result: nil,
                   validation_type: nil, profile: nil, text: nil)
      local_variables.each do |k|
        instance_variable_set("@#{k}", binding.local_variable_get(k))
      end
    end

    # Returns the validation result as an OperationOutcome
    #
    # @return [FHIR::OperationOutcome] The OperationOutcome
    def to_operation_outcome; end

    # Returns the result of the validation as a Hash
    #
    # @param [Hash] The results of the validation
    def to_hash; end
  end
end
