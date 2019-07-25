describe FHIR::Validation::DataTypeValidator do

  let(:validator) { FHIR::Validation::DataTypeValidator }

  let(:resource) do
    FHIR::Patient.new(id: 2,
                      name: {given: 'Bob'},
                      communication: [{language: 'English'}, {language: 'Spanish'}],
                      deceasedBoolean: false,
                      deceasedDateTime: 'YYYY-MM-DD')
  end

  describe '#validate' do
    it 'skips the root element' do
      results = validator.validate(resource, element_definition)
      expect(results).to be_nil
    end
    context 'with an element with a single type' do
      let(:element_definition) do
        FHIR::ElementDefinition.new(id: 'Patient.name',
                                    path: 'Patient.name',
                                    type: {code: 'HumanName'})
      end
      it 'returns an array of results for the single type' do
        results = validator.validate(resource, element_definition)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
    end
    context 'with an element that has a choice of types' do
      let(:resource) do
        obs = FHIR::Observation.new(valueQuantity: {value: 2, code: 'mm'})
        obs.valueCodeableConcept = FHIR::CodeableConcept.new(coding: {code: 'foo', system: 'bar'}, text: 'fake')
        obs
      end
      let(:element_definition) do
        FHIR::ElementDefinition.new(id: 'Observation.value[x]',
                                    path: 'Observation.value[x]',
                                    type: types)
      end

      let(:type1) { {code: 'Quantity'} }

      let(:type2) { {code: 'CodeableConcept'} }

      let(:types) do
        [type1, type2]
      end
      it 'returns an array of results for elements with a choice of type' do
        results = validator.validate(resource, element_definition)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to include(have_attributes(element_path: a_string_including(element_definition.type[0].code)))
        expect(results).to include(have_attributes(element_path: a_string_including(element_definition.type[1].code)))
        expect(results).to all(have_attributes(is_successful: true))
      end
    end
  end
end