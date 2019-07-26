describe FHIR::Validation::CardinalityValidator do

  let(:validator) { FHIR::Validation::CardinalityValidator }
  let(:resource) do
    FHIR::Patient.new(id: 2)
  end
  describe '#validate' do
    let(:element_definition) do  FHIR::ElementDefinition.new(min: 0,
                                                             max: 1,
                                                             id: 'Patient',
                                                             path: 'Patient')
    end

    it 'skips cardinality on the root element' do
      results = validator.validate(resource, element_definition)
      expect(results).to be_nil
    end

    context 'when the cardinality is 0..1' do
      let(:element_definition) do  FHIR::ElementDefinition.new(min: 0,
                                                               max: 1,
                                                               id: 'Patient.id',
                                                               path: 'Patient.id')
      end
      it 'passes when the element has a single value' do
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
      it 'fails when more than one element is present' do
        resource.id = [1,2]
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: false))
      end
      it 'passes when no elements are present' do
        resource.id = nil
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
    end

    context 'when the cardinality is 0..*' do
      let(:element_definition) do  FHIR::ElementDefinition.new(min: 0,
                                                               max: '*',
                                                               id: 'Patient.id',
                                                               path: 'Patient.id')
      end
      it 'passes when the element has a single value' do
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
      it 'passes when more than one element is present' do
        resource.id = [1,2]
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
      it 'passes when no elements are present' do
        resource.id = nil
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
    end

    context 'when the cardinality is 1..1' do
      let(:element_definition) do  FHIR::ElementDefinition.new(min: 1,
                                                               max: 1,
                                                               id: 'Patient.id',
                                                               path: 'Patient.id')
      end
      it 'passes when the element has a single value' do
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
      it 'fails when more than one element is present' do
        resource.id = [1,2]
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: false))
      end
      it 'fails when no elements are present' do
        resource.id = nil
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: false))
      end
    end

    context 'when the cardinality is 1..*' do
      let(:element_definition) do  FHIR::ElementDefinition.new(min: 1,
                                                               max: '*',
                                                               id: 'Patient.id',
                                                               path: 'Patient.id')
      end
      it 'passes when the element has a single value' do
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
      it 'passes when more than one element is present' do
        resource.id = [1,2]
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: true))
      end
      it 'fails when no elements are present' do
        resource.id = nil
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :cardinality))
        expect(results).to all(have_attributes(is_successful: false))
      end
    end
  end
end