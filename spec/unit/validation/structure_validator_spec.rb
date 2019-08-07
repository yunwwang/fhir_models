describe FHIR::Validation::StructureValidator do
  FIXTURES_DIR = File.join('test', 'fixtures')

  # let(:profile) {FHIR::StructureDefinition.new}
  # let(:validator) do
  #   FHIR::Validation::StructureValidator.new(profile)
  # end
  #
  let(:profile) {FHIR::StructureDefinition.new(snapshot: {element: elements})}
  let(:elements) do
    [FHIR::ElementDefinition.new(id: 'Patient',
                                path: 'Patient',
                                min: 0,
                                max: '*'),
     FHIR::ElementDefinition.new(id: 'Patient.extension',
                                path: 'Patient.extension',
                                min: 0,
                                max: '*'),
     FHIR::ElementDefinition.new(id: 'Patient.extension:foo',
                                 path: 'Patient.extension',
                                 sliceName: 'foo',
                                 min: 0,
                                 max: '*',
                                 type: [
                                     {code: 'Extension', profile: ['http://foo.org']}
                                 ]),
    ]
  end

  let(:resource) do
    FHIR::Patient.new(extension: [{url: 'bar'}, {url: 'http://foo.org'}])
  end

  let(:validator) do
    FHIR::Validation::StructureValidator.new(profile)
  end

  context 'with the default validators' do
    before(:example) do
      @results = validator.validate(resource)
    end
    it 'returns cardinality results' do
      cardinality_results = @results.select { |res| res.validation_type == :cardinality }
      expect(cardinality_results.length.positive?).to be_truthy
    end
  end

  # context 'with US Core Patient Profile Validator' do
  #   let(:us_core_profile_validator) do
  #     us_core_patient = File.join(FIXTURES_DIR, 'us_core', 'StructureDefinition-us-core-patient.json')
  #     json = File.read(us_core_patient)
  #     p_validator = FHIR::Validation::StructureValidator.new(FHIR.from_contents(json))
  #     #p_validator.register_element_validator(FHIR::Validation::CardinalityValidator)
  #     p_validator
  #   end
  #
  #   let(:patient_resource) do
  #     patient_record = File.join(FIXTURES_DIR, ['invalid_resources', 'invalid-Patient-example.json'])
  #     json = File.read(patient_record)
  #     FHIR.from_contents(json)
  #   end
  #
  #   #before { validator.register_validator_module(us_core_profile_validator) }
  #
  #   it '#validate' do
  #     results = us_core_profile_validator.validate(patient_resource)
  #     results.first.all_results
  #     expect(results).to_not be_empty
  #   end
  #
  #   it 'checks element cardinality' do
  #     results = validator.validate(patient_resource)
  #     cardinality_results = results.select { |x| x.validation_type == :cardinality }
  #     expect(cardinality_results).to_not be_empty
  #   end
  #
  #   it 'skips checking the cardinality of the root element' do
  #     results = validator.validate(patient_resource)
  #     root_cardinality_results = results.select { |x| x.element_path == 'Patient' }
  #     expect(root_cardinality_results).to be_empty
  #   end
  # end
end