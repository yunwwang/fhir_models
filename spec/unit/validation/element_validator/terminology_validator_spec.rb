describe FHIR::Validation::TerminologyValidator do
  data_types = %w[CodeableConcept Quantity Coding]
  bindings = %w[required extensible preferred example]

  data_binding_pairs = data_types.product(bindings)

  validation_options = [true, false]
  validation_combinations = Array.new(3, validation_options)

  let(:in_system) do
    lambda do
      true
    end
  end

  let(:validator) { described_class.new }

  it 'contains no validators initially' do
    expect(validator.vs_validators).to be_empty
  end

  it 'allows additional validators to be added' do
    vs_validator = { 'foo' => ->(_coding) { true } }
    validator.register_vs_validator(vs_validator.keys.first, vs_validator[vs_validator.keys.first])
    expect(validator.vs_validators).to eq(vs_validator)
  end

  it 'allows validators to be removed' do
    vs_validator = { 'foo' => ->(_coding) { true } }
    validator.register_vs_validator(vs_validator.keys.first, vs_validator[vs_validator.keys.first])
    validator.clear_vs_validators
    expect(validator.vs_validators).to be_empty
  end

  shared_context 'when ValueSet is known' do |known|
    known ? let(:value_set) { 'foo' } : let(:value_set) { 'bar' }
  end

  shared_context 'when CodeSystem is known' do |known|
    known ? let(:code_system) { 'qux' } : let(:code_system) { 'corge' }
  end

  shared_context 'when code is in the ValueSet' do |included|
    let(:value_set_validator) do
      { 'foo' => ->(_coding) { included } }
    end
  end

  shared_context 'when code is in the CodeSystem' do |included|
    let(:code_system_validator) do
      { 'qux' => ->(_coding) { included } }
    end
  end

  shared_context 'with Resource type' do |resource|
    let(:resource) do
      case resource
      when 'CodeableConcept'
        FHIR::CodeableConcept.new(coding: { code: 'waldo', system: code_system })
      when 'Quantity'
        FHIR::Quantity.new(code: 'waldo', system: code_system)
      when 'Coding'
        FHIR::Coding.new(code: 'waldo', system: code_system)
      end
    end
  end

  shared_context 'with ElementDefinition' do |binding_strength, type, second_type = nil|
    let(:element_definition) do
      types = [{ code: type }]
      types.push(code: second_type) if second_type
      FHIR::ElementDefinition.new(id: "Element#{'[x]' if second_type}",
                                  path: "Element#{'[x]' if second_type}",
                                  binding: { strength: binding_strength, valueSet: value_set },
                                  type: types)
    end
  end

  shared_examples 'terminology results' do
    it 'contains terminology results' do
      expect(results).to all(have_attributes(validation_type: :terminology))
    end
  end

  shared_examples 'results status' do |status|
    it 'has the expected result' do
      expect(results).to all(have_attributes(result: status))
    end
  end

  shared_examples 'expected number of results' do |number|
    it 'returns the expected number of results' do
      expect(results.size).to eq(number)
    end
  end

  shared_examples 'result includes text containing' do |text|
    it 'result includes expected text' do
      expect(results).to all(have_attributes(text: a_string_including(text)))
    end
  end

  shared_examples 'code or system missing from element' do |number_of_results, included_text|
    include_examples 'terminology results'
    include_examples 'results status', :warn
    include_examples 'expected number of results', number_of_results
    include_examples 'result includes text containing', included_text
  end

  shared_examples 'expected results' do |validation_combo, binding_strength|
    required_strength = (binding_strength == 'required')
    fail_strength = required_strength ? :fail : :warn

    it 'returns two results' do
      expect(results.size).to eq(2)
    end

    if validation_combo[0]
      it 'checks for inclusion in the ValueSet' do
        expect(results.first).to have_attributes(result: (validation_combo[2] ? :pass : fail_strength),
                                                 text: a_string_including("codings from #{value_set}"))
      end
    else
      it 'warns that the ValueSet validator is missing' do
        expect(results.first).to have_attributes(result: :warn,
                                                 text: a_string_including('Missing Validator for bar'))
      end
    end

    if validation_combo[1]
      it 'checks for inclusion in the CodeSystem' do
        expect(results.last).to have_attributes(result: (validation_combo[3] ? :pass : :fail),
                                                text: a_string_including("codings from #{code_system}"))
      end
    else
      it 'warns that the CodeSystem validator is missing' do
        expect(results.last).to have_attributes(result: :warn,
                                                text: a_string_including('Missing Validator for corge'))
      end
    end

    it 'includes terminology results' do
      expect(results).to all(have_attributes(validation_type: :terminology))
    end
  end

  describe '#validate' do
    let(:element_definition) do
      FHIR::ElementDefinition.new(id: 'Element',
                                  path: 'Element',
                                  binding: { strength: 'required', valueSet: 'asdf' },
                                  type: [{ code: 'CodeableConcept' }])
    end

    let(:results) { validator.validate(resource, element_definition) }

    context 'when the system is missing from the element' do
      let(:resource) { FHIR::CodeableConcept.new(coding: { code: 'waldo' }) }

      include_examples 'code or system missing from element', 1, 'missing system'
    end

    context 'when the code is missing from the element' do
      let(:resource) { FHIR::CodeableConcept.new(coding: { system: 'adsf' }) }

      include_examples 'code or system missing from element', 1, 'missing code'
    end

    context 'when both the code and system are missing from the element' do
      let(:resource) { FHIR::CodeableConcept.new(coding: { text: 'nope' }) }

      include_examples 'code or system missing from element', 2, 'missing'
    end

    [nil, 'FakeType'].each do |secondary_type|
      data_binding_pairs.each do |data_binding_pair|
        validation_combinations.each do |combo|
          context "with a #{data_binding_pair[0]}, #{data_binding_pair[1]} binding, #{'un' unless combo[0]}known ValueSet #{'not ' unless combo[2]}containing the code, and #{'un' unless combo[1]}known CodeSystem #{'not ' unless combo[3]}containing the code" do
            include_context 'with ElementDefinition', data_binding_pair[1], data_binding_pair[0], secondary_type
            include_context 'with Resource type', data_binding_pair[0]
            include_context 'when ValueSet is known', combo[0]
            include_context 'when CodeSystem is known', combo[1]
            include_context 'when code is in the ValueSet', combo[2]
            include_context 'when code is in the CodeSystem', combo[3]

            let(:validator) { described_class.new(value_set_validator.merge(code_system_validator)) }
            let(:results) { validator.validate(resource, element_definition) }

            include_examples 'expected results', combo, data_binding_pair[1]
          end
        end
      end
    end
  end
end
