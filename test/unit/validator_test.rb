require_relative '../test_helper'

class ValidatorTest < Test::Unit::TestCase
  FIXTURES_DIR = File.join('test', 'fixtures')

  class FakeValidator
    def validate(resource)
      return 'result'
    end
  end

  def setup
    us_core_patient = File.join(FIXTURES_DIR, 'us_core', 'StructureDefinition-us-core-patient.json')
    json = File.read(us_core_patient)
    @us_core_patient_profile = FHIR.from_contents(json)
  end

  def test_validator
    validator = FHIR::Validator.new
    assert validator.validator_modules.empty?
    validator.register_validator_module(1)
    assert validator.validator_modules.include? 1

    validator.register_validator_module([3,4,5])
    assert validator.validator_modules.include? 4

    assert validator.validator_modules.length == 4

    validator = FHIR::Validator.new([1,2,3])
    validator.register_validator_module(1) # Should not add duplicate validators
    assert validator.validator_modules.length == 3
  end

  def test_validator_validate
    validator = FHIR::Validator.new
    validator.register_validator_module([FakeValidator.new, FakeValidator.new])
    results = validator.validate(1)
    assert results.length == 2
  end

  def test_us_core_validation
    # Setup the Validator
    profile_validator = FHIR::ProfileValidator.new(@us_core_patient_profile)
    validator = FHIR::Validator.new(profile_validator)

    # Load the patient resource to be validated
    example_name = 'invalid-Patient-example.json'
    patient_record = File.join(FIXTURES_DIR, ['invalid_resources', example_name])
    json = File.read(patient_record)
    resource = FHIR.from_contents(json)

    validator.show_skipped = false
    results = validator.validate(resource)
    assert !results.empty?
  end

  # def test_profile_code_system_check
  #   # Clear any registered validators
  #   FHIR::StructureDefinition.clear_all_validates_vs
  #   FHIR::StructureDefinition.validates_vs "http://hl7.org/fhir/ValueSet/marital-status" do |coding|
  #     false # fails so that the code system validation happens
  #   end
  #   FHIR::StructureDefinition.validates_vs "http://hl7.org/fhir/v3/MaritalStatus" do |coding|
  #     true # no errors related to http://hl7.org/fhir/v3/MaritalStatus should be present
  #   end
  #
  #   example_name = 'invalid-Patient-example.json'
  #   patient_record = File.join(FIXTURES_DIR, ['invalid_resources', example_name])
  #   input_json = File.read(patient_record)
  #   resource = FHIR::Json.from_json(input_json)
  #
  #   # validate against the declared profile
  #   profile = PROFILES[resource.meta.profile.first]
  #   profile = FHIR::Definitions.profile(resource.meta.profile.first) unless profile
  #   assert profile, "Failed to find profile: #{resource.meta.profile.first}"
  #   errors = profile.validate_resource(resource)
  #   errors << "Validated against #{resource.meta.profile.first}" unless errors.empty?
  #
  #   assert !errors.empty?, 'Expected code valueset validation error.'
  #   assert errors.detect{|x| x.start_with?('Patient.maritalStatus has no codings from http://hl7.org/fhir/ValueSet/marital-status.')}
  #   assert !errors.detect{|x| x.start_with?('Patient.maritalStatus has no codings from http://hl7.org/fhir/v3/MaritalStatus.')}
  #   # check memory
  #   before = check_memory
  #   resource = nil
  #   profile = nil
  #   wait_for_gc
  #   after = check_memory
  #   assert_memory(before, after)
  # end
end