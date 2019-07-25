# Provides terminology validation
class TerminologyValidator
  attr_accessor :vs_validators

  def initialize
    @vs_validators = {}
  end

  def clear_validator(valueset_uri)
    @vs_validators.delete valueset_uri
  end

  def clear_all_validators()
    @vs_validators = {}
  end

  def add_validator(valueset_uri, &validator_fn)
    @vs_validators[valueset_uri] = validator_fn
  end

  # A Coding contains a system and a code
  #
  # The code and system will be checked against the code system itself if a valueset is not provided
  def validate_coding(code, system, valueset = nil)
    valueset ||= system
    @vs_validators[valueset].call('system' => system, 'code' => code)
  end

  def validate_code(code, valueset)
    valueset ||= system
    @vs_validators[valueset].call(code)
  end

  def terminology_result
    result = FHIR::ValidationResult.new
  end

  def validate(element, element_definition, current_path, skip = false)
    results = []
    binding = element_definition.binding
    # TODO: Could also not return here and return a skip for elements without a binding
    #return if binding.nil?

    valueSet = binding&.valueSet

    type_code = if element_definition.type.one?
                  element_definition.type.first.code
                else
                  element_definition.type.find do |datatype|
                    /[^.]+$/.match(element_definition.path.gsub('[x]', datatype.code.capitalize)) == /[^.]+$/.match(current_path)
                  end&.code
                end

    if type_code == 'CodeableConcept'
      element.coding.each_with_index do |coding, index|
        result = FHIR::ValidationResult.new
        result.element_definition = element_definition
        result.element_path = "#{current_path}[#{index}]"
        result.validation_type = :terminology
        if coding.code.nil? || coding.system.nil?
          result.is_successful = :skipped
          result.text = "#{current_path}[#{index}] has no #{'code' if coding.code.nil?}" \
                        "#{' or' if coding.code.nil? && coding.system.nil?} #{' system' if coding.system.nil?} ."
        else
          result.is_successful = validate_coding(coding.code, coding.system)
        end
        results.push result
      end
    elsif ['Coding', 'Quantity'].include? type_code
      result = FHIR::ValidationResult.new
      result.element_definition = element_definition
      result.element_path = current_path
      result.validation_type = :terminology
      if element.code.nil? || element.system.nil?
        result.is_successful = :skipped
        result.text = "#{current_path} has no #{'code' if coding.code.nil?}" \
                        "#{' or' if coding.code.nil? && coding.system.nil?} #{' system' if coding.system.nil?} ."
      else
        result.is_successful = validate_coding(element.code, element.system)
      end
      results.push result
    elsif type_code == 'code'
      result = FHIR::ValidationResult.new
      result.element_definition = element_definition
      result.element_path = current_path
      result.validation_type = :terminology
      result.is_successful = :skipped
    end
  end
end
