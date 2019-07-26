describe FHIR::Validation::TerminologyValidator do

  let(:validator) { FHIR::Validation::TerminologyValidator.new(foo: true, bar: false) }
  let(:resource) do
    FHIR::Patient.new(maritalStatus: {coding: "it's complicated"})
  end
  describe '#validate' do
    context 'when the binding is required' do
      let(:element_definition) do  FHIR::ElementDefinition.new(id: 'Patient.id',
                                                               path: 'Patient.id',
                                                               binding: {strength: 'required', valueSet: 'foo'},
                                                               type: [{code: 'CodeableConcept'}])
      end

      it 'passes when the code is in the value set' do
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :terminology))
        expect(results).to all(have_attributes(is_successful: true))
      end

      it 'fails when the code is missing from the valueset' do
        element_definition.binding.valueSet = 'bar'
        results = validator.validate(resource, element_definition)
        expect(results.size).to eq(1)
        expect(results).to all(have_attributes(validation_type: :terminology))
        expect(results).to all(have_attributes(is_successful: false))
      end
    end
  end
end