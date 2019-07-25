describe FHIR::Validation::DataTypeValidator do

  let(:validator) { FHIR::Validation::DataTypeValidator }

  let(:element) { double(true) }
  let(:element_definition) { instance_double(FHIR::ElementDefinition) }
  let(:type1) do
    type1 = FHIR::ElementDefinition::Type.new
    type1.code = 'boolean'
    type1
  end
  let(:type2) do
    type2 = FHIR::ElementDefinition::Type.new
    type2.code = 'dateTime'
    type2
  end
  let(:types) do
    [type1, type2]
  end

  describe '#validate' do
    it 'returns an array of results for elements with a choice of type' do
      allow(element_definition).to receive(:path)
                                       .and_return('Foo.bar[x]')
      allow(element_definition).to receive(:type)
                                       .and_return(types)
      results = validator.validate(element, element_definition, 'Foo.barBoolean')
      expect(results).to include( an_object_having_attributes(validation_type: :cardinality))
    end
    it 'returns an array of results for elements with a single type' do
      allow(element_definition).to receive(:path)
                                       .and_return('Foo.bar')
      allow(element_definition).to receive(:type)
                                       .and_return([type1])
      results = validator.validate(element, element_definition, 'Foo.bar')
      expect(results).to include( an_object_having_attributes(validation_type: :cardinality))
    end
  end
end