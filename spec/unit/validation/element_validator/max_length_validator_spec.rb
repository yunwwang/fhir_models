describe FHIR::Validation::MaxLengthValidator do
  let(:validator) {FHIR::Validation::MaxLengthValidator}
  let(:resource) { 'foo' }
  let(:element_definition) {FHIR::ElementDefinition.new(id: 'Element', path: 'Element')}

  context 'when the string is shorter than the maxLength' do
    before do
      element_definition.maxLength = 10
      @results = validator.validate(resource, element_definition)
    end

    it 'returns one result' do
      expect(@results.size).to eq(1)
    end

    it 'passes' do
      expect(@results.first).to have_attributes(validation_type: :max_length)
      expect(@results.first).to have_attributes(result: :pass)
    end
  end

  context 'when the string is longer than the maxLength' do
    before do
      element_definition.maxLength = 2
      @results = validator.validate(resource, element_definition)
    end

    it 'returns one result' do
      expect(@results.size).to eq(1)
    end

    it 'fails' do
      expect(@results.first).to have_attributes(validation_type: :max_length)
      expect(@results.first).to have_attributes(result: :fail)
    end
  end

  context 'when no max length is specified' do
    before do
      element_definition.maxLength = nil
      @results = validator.validate(resource, element_definition)
    end

    it 'returns no results' do
      expect(@results).to be_nil
    end
  end
end