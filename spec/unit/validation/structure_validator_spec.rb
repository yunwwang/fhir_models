describe FHIR::Validation::StructureValidator do
  FIXTURES_DIR = File.join('test', 'fixtures')

  # let(:profile) {FHIR::StructureDefinition.new}
  # let(:validator) do
  #   FHIR::Validation::StructureValidator.new(profile)
  # end
  #
  let(:profile) { FHIR::StructureDefinition.new(snapshot: { element: elements }) }
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
                                   { code: 'Extension', profile: ['http://foo.org'] }
                                 ])]
  end

  let(:resource) do
    FHIR::Patient.new(extension: [{ url: 'bar' }, { url: 'http://foo.org' }])
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
end
