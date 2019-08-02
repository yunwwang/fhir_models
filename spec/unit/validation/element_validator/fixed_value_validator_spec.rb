describe FHIR::Validation::FixedValueValidator do

  let(:validator) { FHIR::Validation::FixedValueValidator }

  let(:element) { double('867-5309') }
  #let(:element_definition) { instance_double(FHIR::ElementDefinition) }
  let(:element_definition) { FHIR::ElementDefinition.new }

  describe '#validate' do
    it 'returns a single result related to the fixed value' do

      # allow(element_definition).to receive(:fixed)
      #                                  .and_return(element)
      element_definition.fixedString = element

      results = validator.validate(element, element_definition)
      expect(results.validation_type).to be(:fixed_value)
      expect(results.result).to be(true)
    end

    it 'detects when the fixed value is incorrect' do

      # allow(element_definition).to receive(:fixed)
      #                                  .and_return('555-5555')

      results = validator.validate(element, element_definition)
      expect(results.validation_type).to be(:fixed_value)
      expect(results.result).to be(false)
    end
  end
end