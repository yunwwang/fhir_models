describe FHIR::Validation::TerminologyValidator do
  let(:validator) do
    FHIR::Validation::TerminologyValidator.new('foo' => lambda { |coding| true},
                                               'bar' => lambda { |coding| false})
  end

  data_types = {'CodeableConcept' => FHIR::CodeableConcept.new(coding: {code: 'bar', system: 'foo'}),
                'Quantity' => FHIR::Quantity.new(code: 'bar', system: 'foo'),
                'Coding' => FHIR::Coding.new(code: 'bar', system: 'foo')}
  bindings = ['required', 'extensible', 'preferred', 'example']

  data_binding_pairs = data_types.keys.product(bindings)

  shared_examples 'valueset code' do |binding_strength|

    it 'passes when the code is in the value set' do
      results = validator.validate(resource, element_definition)
      expect(results.size).to eq(1)
      expect(results).to all(have_attributes(validation_type: :terminology))
      expect(results).to all(have_attributes(is_successful: true))
    end

    required_strength = binding_strength == 'required'

    it "#{required_strength ? 'fails' : 'warns'} when the code is missing from the valueset" do
      element_definition.binding.valueSet = 'bar'
      results = validator.validate(resource, element_definition)
      expect(results.size).to eq(1)
      expect(results).to all(have_attributes(validation_type: :terminology))
      expect(results).to all(have_attributes(is_successful: required_strength ? false : :warn))
    end

    it 'warns when the valueset validator is missing' do
      element_definition.binding.valueSet = 'baz'
      results = validator.validate(resource, element_definition)
      expect(results.size).to eq(1)
      expect(results).to all(have_attributes(validation_type: :terminology))
      expect(results).to all(have_attributes(is_successful: :warn))
    end
  end

  describe '#validate' do
    data_binding_pairs.each do |data_binding_pair|
      context "with a #{data_binding_pair[0]} type" do
        let(:resource) { data_types[data_binding_pair[0]] }
        context "with a #{data_binding_pair[1]} binding" do
          let(:element_definition) do
            FHIR::ElementDefinition.new(id: 'Element',
                                        path: 'Element',
                                        binding: {strength: data_binding_pair[1], valueSet: 'foo'},
                                        type: [{code: data_binding_pair[0]}])
          end
          include_examples 'valueset code', data_binding_pair[1]
        end
      end
    end
  end
end