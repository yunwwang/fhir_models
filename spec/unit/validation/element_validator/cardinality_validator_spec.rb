describe FHIR::Validation::DataTypeValidator do

  let(:validator) { FHIR::Validation::DataTypeValidator }

  let(:element) { double({'name' => 'Bob'}) }
  let(:element_definition) { instance_double(FHIR::ElementDefinition) }

  describe '#validate' do
    it 'returns a single validation results related to cardinality' do

      allow(element_definition).to receive(:min)
                                       .and_return(0)
      allow(element_definition).to receive(:max)
                                       .and_return(1)
      allow(element_definition).to receive(:path)
                                       .and_return('Foo.bar')

      results = validator.validate(element, element_definition)
      expect(results.validation_type).to be(:cardinality)
      expect(results.is_successful).to be(true)
    end

    it 'detects when too many elements are present' do
      allow(element_definition).to receive(:min)
                                       .and_return(0)
      allow(element_definition).to receive(:max)
                                       .and_return(1)
      allow(element_definition).to receive(:path)
                                       .and_return('Foo.bar')

      results = validator.validate([element, element], element_definition)
      expect(results.validation_type).to be(:cardinality)
      expect(results.is_successful).to be(false)
    end

    it 'detects when too few elements are present' do
      allow(element_definition).to receive(:min)
                                       .and_return(1)
      allow(element_definition).to receive(:max)
                                       .and_return('*')
      allow(element_definition).to receive(:path)
                                       .and_return('Foo.bar')

      results = validator.validate(nil, element_definition)
      expect(results.validation_type).to be(:cardinality)
      expect(results.is_successful).to be(false)

      results = validator.validate([], element_definition)
      expect(results.validation_type).to be(:cardinality)
      expect(results.is_successful).to be(false)
    end

    it 'can check for an exact number of elements to be present' do
      allow(element_definition).to receive(:min)
                                       .and_return(2)
      allow(element_definition).to receive(:max)
                                       .and_return(2)
      allow(element_definition).to receive(:path)
                                       .and_return('Foo.bar')

      results = validator.validate([element, element], element_definition)
      expect(results.validation_type).to be(:cardinality)
      expect(results.is_successful).to be(true)

      results = validator.validate(element, element_definition)
      expect(results.validation_type).to be(:cardinality)
      expect(results.is_successful).to be(false)
    end

    it 'skips cardinality on the root element' do
      allow(element_definition).to receive(:min)
                                       .and_return(0)
      allow(element_definition).to receive(:max)
                                       .and_return('*')
      allow(element_definition).to receive(:path)
                                       .and_return('Foo')

      results = validator.validate(element, element_definition)
      expect(results.validation_type).to be(:cardinality)
      expect(results.is_successful).to be(:skipped)
    end
  end
end