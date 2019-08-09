describe FHIR::Model do
  describe '#retrieve_elements_by_definition' do
    let(:resource) do
      FHIR::Patient.new(id: 2,
                        extension: [{url: 'bar'}, {url: 'http://foo.org'}],
                        name: {given: 'Bob'},
                        communication: [{language: 'English'}, {language: 'Spanish'}],
                        deceasedBoolean: false,
                        deceasedDateTime: 'YYYY-MM-DD')
    end

    it 'returns the root element (the resource)' do
      element_definition = FHIR::ElementDefinition.new(id: 'Patient', path: 'Patient')
      expect(resource.retrieve_elements_by_definition(element_definition)).to eq({element_definition.id => resource})
    end

    it 'returns an attribute of element' do
      element_definition = FHIR::ElementDefinition.new(id: 'Patient.id', path: 'Patient.id')
      expect(resource.retrieve_elements_by_definition(element_definition)).to eq({element_definition.id => resource.id})
    end

    context 'with choice of types' do
      let(:element_definition) do
        FHIR::ElementDefinition.new(id: 'Patient.deceased[x]',
                                    path: 'Patient.deceased[x]',
                                    type: [{code: 'boolean'}, {code: 'dateTime'}])
      end
      it 'returns all the elements present if there is a choice of type' do
        titlecase_choice = [
            element_definition.id.gsub('[x]',
                                       element_definition.type.first.code.capitalize),
            element_definition.id.gsub('[x]',
                                       "#{element_definition.type.last.code[0].capitalize}"\
                                     "#{element_definition.type.last.code[1..-1]}")]
        expected_communications = {
            titlecase_choice.first => resource.deceasedBoolean,
            titlecase_choice.last => resource.deceasedDateTime
        }
        expect(resource.retrieve_elements_by_definition(element_definition)).to eq(expected_communications)
      end

      it 'returns an array of all the elements present if there is a choice of type normalized to the element' do
        expected_communications = { element_definition.id => [ resource.deceasedBoolean, resource.deceasedDateTime ]}
        expect(resource.retrieve_elements_by_definition(element_definition, normalized: true)).to eq(expected_communications)
      end
    end

    context 'with sliced extensions' do
      it 'returns all extensions' do
        element_definition = FHIR::ElementDefinition.new(id: 'Patient.extension', path: 'Patient.extension')
        expect(resource.retrieve_elements_by_definition(element_definition)).to eq({element_definition.id => resource.extension})
      end
      it 'returns the extensions indexed' do
        expected_result = {'Patient.extension[0]' => resource.extension[0],
                           'Patient.extension[1]' => resource.extension[1]}
        element_definition = FHIR::ElementDefinition.new(id: 'Patient.extension', path: 'Patient.extension')
        expect(resource.retrieve_elements_by_definition(element_definition, indexed: true)).to eq(expected_result)
      end
      it 'returns the sliced extension' do
        element_definition = FHIR::ElementDefinition.new(id: 'Patient.extension:foo',
                                                         path: 'Patient.extension',
                                                         sliceName: 'foo',
                                                         type: [{code: 'Extension', profile: ['http://foo.org']}])
        expect(resource.retrieve_elements_by_definition(element_definition)).to eq({element_definition.path => [resource.extension[1]]})
      end

      it 'returns the sliced extension indexed' do
        element_definition = FHIR::ElementDefinition.new(id: 'Patient.extension:foo',
                                                         path: 'Patient.extension',
                                                         sliceName: 'foo',
                                                         type: [{code: 'Extension', profile: ['http://foo.org']}])
        expect(resource.retrieve_elements_by_definition(element_definition, indexed: true)).to eq({"#{element_definition.path}[1]" => resource.extension[1]})
      end
    end
  end
end