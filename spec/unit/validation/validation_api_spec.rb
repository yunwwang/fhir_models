describe 'Profile Resource Validation' do
  FIXTURES_DIR = File.join('test', 'fixtures')

  let(:validator) {FHIR::Validator.new}
  let(:profile_validator) { FHIR::ProfileValidator.new(structure_definition)}
  let(:cardinality_validator) { spy(FHIR::Validation::CardinalityValidator)}
  let(:element_definition) do
    element_definition = FHIR::ElementDefinition.new(id: 'Patient', path: 'Patient')
  end
  let(:structure_definition) do
    FHIR::StructureDefinition.new(snapshot:{element: [element_definition]})
  end
  let(:resource) do
    {}
  end

  it 'initially has no validator modules' do
    expect(validator.validator_modules).to be_empty
  end

  specify '#register_element_validator' do
    profile_validator.register_element_validator(cardinality_validator)
    profile_validator.validate(resource)
    expect(cardinality_validator).to have_received(:validate)
                                       .with(resource, element_definition)
  end

  context 'with US Core Patient Profile Validator' do
    let(:us_core_profile_validator) do
      us_core_patient = File.join(FIXTURES_DIR, 'us_core', 'StructureDefinition-us-core-patient.json')
      json = File.read(us_core_patient)
      p_validator = FHIR::ProfileValidator.new(FHIR.from_contents(json))
      p_validator.register_element_validator(FHIR::Validation::CardinalityValidator)
      p_validator
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
      root_cardinality_results = results.select { |x| x.element_path == 'Patient' }
      expect(root_cardinality_results).to be_empty
    end
  end
end