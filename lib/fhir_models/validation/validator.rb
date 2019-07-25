module FHIR
  # FHIR Resource Validator
  class Validator
    attr_reader :validator_modules
    attr_reader :show_skipped

    # Creates a FHIR Validator
    #
    # @param validator_modules[ValidatorModule, Array, #validate] An array of validator_modules
    def initialize(validator_modules = [])
      @validator_modules = Set.new
      add_validator_module(validator_modules)
    end

    # Register a validator_module
    # @param [#validate] validator_module
    def register_validator_module(validator_module)
      @validator_modules.each { |validator| validator.show_skipped = @show_skipped if validator.respond_to?(:show_skipped) }
      add_validator_module(validator_module)
    end

    # @param resource [FHIR::Model] The Resource to be validated
    # @return [Hash] the validation results
    def validate(resource)
      @validator_modules.flat_map { |validator| validator.validate(resource) }
    end

    def show_skipped=(skip)
      @show_skipped = skip
      @validator_modules.each { |validator| validator.show_skipped = skip }
    end

    # Helper method for adding validator modules
    #
    # This allows an individual validator to be passed or an array of validators
    #
    # @param validators [#validate] The validators to be added
    private def add_validator_module(validators)
      @validator_modules.merge([validators].flatten)
    end
  end
end
