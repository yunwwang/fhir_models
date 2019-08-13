describe FHIR::Validation::CardinalityValidator do

  let(:validator) { FHIR::Validation::CardinalityValidator }

  let(:resource) do
    FHIR::Patient.new
  end
  
  shared_context 'a single element' do
    let(:id) {'the id'}
  end

  shared_context 'multiple elements' do
    let(:id) { [1,2] }
  end

  shared_context 'no elements' do
    let(:id) { nil }
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

    scenarios = {'0..1' => {'a single element' => :pass, 'no elements' => :pass, 'multiple elements' => :fail},
                 '0..*' => {'a single element' => :pass, 'no elements' => :pass, 'multiple elements' => :pass},
                 '1..1' => {'a single element' => :pass, 'no elements' => :fail, 'multiple elements' => :fail},
                 '1..*' => {'a single element' => :pass, 'no elements' => :fail, 'multiple elements' => :pass}}

    scenarios.each do |cardinality, number_of_elements_scenario|
      context "when the cardinality is #{cardinality[0]}..#{cardinality[-1]}" do
        let(:element_definition) do  FHIR::ElementDefinition.new(min: cardinality[0],
                                                                 max: cardinality[-1],
                                                                 id: 'Patient.id',
                                                                 path: 'Patient.id')
        end
        number_of_elements_scenario.each do |number_of_elements, expected_result|
          context "when the element contains #{number_of_elements}" do
            include_context number_of_elements
            it "#{expected_result} when the element contains #{number_of_elements}" do
              resource.id = id
              results = validator.validate(resource, element_definition)
              expect(results.size).to eq(1)
              expect(results).to all(have_attributes(validation_type: :cardinality))
              expect(results).to all(have_attributes(result: expected_result))
            end
          end
        end
      end
    end
  end
end