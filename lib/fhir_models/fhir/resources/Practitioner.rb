module FHIR
  class Practitioner < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'email', 'family', 'gender', 'given', 'phone', 'phonetic', 'telecom', 'active', 'communication', 'identifier', 'name']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Practitioner.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Practitioner.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Practitioner.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Practitioner.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Practitioner.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Practitioner.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Practitioner.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Practitioner.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Practitioner.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'Practitioner.active', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'HumanName', 'path'=>'Practitioner.name', 'min'=>0, 'max'=>Float::INFINITY},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'Practitioner.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'address' => {'type'=>'Address', 'path'=>'Practitioner.address', 'min'=>0, 'max'=>Float::INFINITY},
      'gender' => {'type'=>'code', 'path'=>'Practitioner.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/administrative-gender|4.0.0', 'uri'=>nil}},
      'birthDate' => {'type'=>'date', 'path'=>'Practitioner.birthDate', 'min'=>0, 'max'=>1},
      'photo' => {'type'=>'Attachment', 'path'=>'Practitioner.photo', 'min'=>0, 'max'=>Float::INFINITY},
      'qualification' => {'type'=>'Practitioner::Qualification', 'path'=>'Practitioner.qualification', 'min'=>0, 'max'=>Float::INFINITY},
      'communication' => {'type'=>'CodeableConcept', 'path'=>'Practitioner.communication', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}}
    }

    class Qualification < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Qualification.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Qualification.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Qualification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Qualification.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Qualification.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-2.7-0360', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'Qualification.period', 'min'=>0, 'max'=>1},
        'issuer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Qualification.issuer', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :code              # 1-1 CodeableConcept
      attr_accessor :period            # 0-1 Period
      attr_accessor :issuer            # 0-1 Reference(Organization)
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :active            # 0-1 boolean
    attr_accessor :name              # 0-* [ HumanName ]
    attr_accessor :telecom           # 0-* [ ContactPoint ]
    attr_accessor :address           # 0-* [ Address ]
    attr_accessor :gender            # 0-1 code
    attr_accessor :birthDate         # 0-1 date
    attr_accessor :photo             # 0-* [ Attachment ]
    attr_accessor :qualification     # 0-* [ Practitioner::Qualification ]
    attr_accessor :communication     # 0-* [ CodeableConcept ]

    def resourceType
      'Practitioner'
    end
  end
end