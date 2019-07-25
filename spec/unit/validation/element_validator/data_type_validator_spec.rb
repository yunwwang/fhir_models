describe FHIR::Validation::DataTypeValidator do

  let(:validator) { FHIR::Validation::DataTypeValidator }

  let(:resource) do
    FHIR::Patient.new(id: 2,
                      name: {given: 'Bob'},
                      communication: [{language: 'English'}, {language: 'Spanish'}],
                      deceasedBoolean: false,
                      deceasedDateTime: 'YYYY-MM-DD')
  end

  let(:element_definition) do
    FHIR::ElementDefinition.new(id: 'Patient',
                                path: 'Patient',
                                type: types)
  end

  let(:type1) do
    {code: 'boolean'}
  end

  let(:type2) do
    # type2 = FHIR::ElementDefinition::Type.new
    # type2.code = 'dateTime'
    # type2
    {code: 'dateTime'}
  end

  let(:types) do
    [type1, type2]
  end

  describe '#validate' do
    it 'skips the root element' do
      results = validator.validate(resource, element_definition)
      expect(results).to be_nil
    end
    context 'with an element with a single type' do
      let(:element_definition) do
        FHIR::ElementDefinition.new(id: 'Patient.communication',
                                    path: 'Patient.communication',
                                    type: {code: 'HumanName'})
      end
      it 'returns an array of results for the single type' do
        results = validator.validate(resource, element_definition)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
    end
    context 'with an element that has a choice of types' do
      it 'returns an array of results for elements with a choice of type' do
      end
    end
  end
end