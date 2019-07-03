describe 'Profile Resource Validation' do
  FIXTURES_DIR = File.join('test', 'fixtures')

  let(:validator) {FHIR::Validator.new}

  it 'initially has no validator modules' do
    expect(validator.validator_modules).to be_empty
  end

  context 'with US Core Patient Profile Validator' do
    let(:us_core_profile_validator) do
      us_core_patient = File.join(FIXTURES_DIR, 'us_core', 'StructureDefinition-us-core-patient.json')
      json = File.read(us_core_patient)
      FHIR::ProfileValidator.new(FHIR.from_contents(json))
    end

    let(:patient_resource) do
      patient_record = File.join(FIXTURES_DIR, ['invalid_resources', 'invalid-Patient-example.json'])
      json = File.read(patient_record)
      FHIR.from_contents(json)
    end

    before { validator.register_validator_module(us_core_profile_validator) }

    it '#validate' do
      results = validator.validate(patient_resource)
      expect(results).to_not be_empty
    end

    it 'checks element cardinality' do
      results = validator.validate(patient_resource)
      cardinality_results = results.select { |x| x.validation_type == :cardinality }
      expect(cardinality_results).to_not be_empty
    end

    it 'skips checking the cardinality of the root element' do
      results = validator.validate(patient_resource)
      cardinality_results = results.select { |x| x.is_successful == :skipped }
      expect(cardinality_results).to_not be_empty
    end
  end
end