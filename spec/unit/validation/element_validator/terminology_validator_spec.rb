describe FHIR::Validation::TerminologyValidator do

  let(:in_system) do
    lambda do
      true
    end
  end

  # let(:validator) do
  #   FHIR::Validation::TerminologyValidator.new('foo' => lambda { |coding| true},
  #                                              'bar' => lambda { |coding| false})
  # end

  # data_types = {'CodeableConcept' => FHIR::CodeableConcept.new(coding: {code: 'waldo', system: 'foo'}),
  #               'Quantity' => FHIR::Quantity.new(code: 'waldo', system: 'foo'),
  #               'Coding' => FHIR::Coding.new(code: 'waldo', system: 'foo')}
  data_types = ['CodeableConcept', 'Quantity', 'Coding']
  bindings = ['required', 'extensible', 'preferred', 'example']

  data_binding_pairs = data_types.product(bindings)

  validation_options = [true, false]
  validation_combinations = validation_options.product(*Array.new(3,validation_options))

  shared_context 'ValueSet is known' do |known|
    known ? let(:value_set) {'foo'} : let(:value_set) {'bar'}
  end

  shared_context 'CodeSystem is known' do |known|
    known ? let(:code_system) {'qux'} : let(:code_system) {'corge'}
  end

  shared_context 'code is in the ValueSet' do |included|
    let(:value_set_validator) do
      {'foo' => lambda { |coding| included}}
    end
  end

  shared_context 'code is in the CodeSystem' do |included|
    let(:code_system_validator) do
      {'qux' => lambda { |coding| included}}
    end
  end

  shared_context 'Resource type' do |resource|
    let(:resource) do
      case resource
      when 'CodeableConcept'
        FHIR::CodeableConcept.new(coding: {code: 'waldo', system: code_system})
      when 'Quantity'
        FHIR::Quantity.new(code: 'waldo', system: code_system)
      when 'Coding'
        FHIR::Coding.new(code: 'waldo', system: code_system)
      end
    end
  end

  shared_context 'ElementDefinition' do |binding_strength, type|
    let(:element_definition) do
      FHIR::ElementDefinition.new(id: 'Element',
                                  path: 'Element',
                                  binding: {strength: binding_strength, valueSet: value_set},
                                  type: [{code: type}])
    end
  end

  let(:validator) { FHIR::Validation::TerminologyValidator.new(value_set_validator.merge(code_system_validator))}

  shared_examples 'expected results' do |validation_combo, binding_strength|
    required_strength = (binding_strength == 'required')
    fail_strength = required_strength ? :fail : :warn

    it 'returns two results' do
      expect(@results.size).to eq(2)
    end

    if validation_combo[0]
      it 'checks for inclusion in the ValueSet' do
        expect(@results.first).to have_attributes(validation_type: :terminology)
        expect(@results.first).to have_attributes(:text => a_string_including("codings from #{value_set}"))
        expect(@results.first).to have_attributes(result: (validation_combo[2] ? :pass : fail_strength))
      end
    else
      it 'warns that the ValueSet validator is missing' do
        expect(@results.first).to have_attributes(validation_type: :terminology)
        expect(@results.first).to have_attributes(:text => a_string_including('Missing Validator for bar'))
        expect(@results.first).to have_attributes(result: :warn)
      end
    end

    if validation_combo[1]
      it 'checks for inclusion in the CodeSystem' do
        expect(@results.last).to have_attributes(validation_type: :terminology)
        expect(@results.last).to have_attributes(:text => a_string_including("codings from #{code_system}"))
        expect(@results.last).to have_attributes(result: (validation_combo[3] ? :pass : :fail))
      end
    else
      it 'warns that the CodeSystem validator is missing' do
        expect(@results.last).to have_attributes(validation_type: :terminology)
        expect(@results.last).to have_attributes(:text => a_string_including('Missing Validator for corge'))
        expect(@results.last).to have_attributes(result: :warn)
      end
    end
  end

  describe '#validate' do
    data_binding_pairs.each do |data_binding_pair|
      context "with a #{data_binding_pair[0]}, #{data_binding_pair[1]} binding, " do
        include_context 'ElementDefinition', data_binding_pair[1], data_binding_pair[0]
        include_context 'Resource type', data_binding_pair[0]
        validation_combinations.each do |combo|
          context "#{'un' unless combo[0]}known ValueSet #{'not ' unless combo[2]}containing the code, and "\
                "#{'un' unless combo[1]}known CodeSystem #{'not ' unless combo[3]}containing the code"do
            include_context 'ValueSet is known', combo[0]
            include_context 'CodeSystem is known', combo[1]
            include_context 'code is in the ValueSet', combo[2]
            include_context 'code is in the CodeSystem', combo[3]
            before(:example) do
              @results = validator.validate(resource, element_definition)
            end
            include_examples 'expected results', combo, data_binding_pair[1]
          end
        end
      end
    end
  end
end