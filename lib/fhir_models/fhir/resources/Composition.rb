module FHIR
  class Composition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'identifier', 'patient', 'type', 'attester', 'author', 'category', 'confidentiality', 'context', 'encounter', 'entry', 'period', 'related-id', 'related-ref', 'section', 'status', 'subject', 'title']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Composition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Composition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Composition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Composition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Composition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Composition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Composition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Composition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Composition.identifier', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'Composition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/composition-status|4.0.0', 'uri'=>nil}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'Composition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/doc-typecodes', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'Composition.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/document-classcodes', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Composition.subject', 'min'=>0, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Composition.encounter', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'Composition.date', 'min'=>1, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Composition.author', 'min'=>1, 'max'=>Float::INFINITY},
      'title' => {'type'=>'string', 'path'=>'Composition.title', 'min'=>1, 'max'=>1},
      'confidentiality' => {'type'=>'code', 'path'=>'Composition.confidentiality', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ConfidentialityClassification|4.0.0', 'uri'=>nil}},
      'attester' => {'type'=>'Composition::Attester', 'path'=>'Composition.attester', 'min'=>0, 'max'=>Float::INFINITY},
      'custodian' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Composition.custodian', 'min'=>0, 'max'=>1},
      'relatesTo' => {'type'=>'Composition::RelatesTo', 'path'=>'Composition.relatesTo', 'min'=>0, 'max'=>Float::INFINITY},
      'event' => {'type'=>'Composition::Event', 'path'=>'Composition.event', 'min'=>0, 'max'=>Float::INFINITY},
      'section' => {'type'=>'Composition::Section', 'path'=>'Composition.section', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Attester < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Attester.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Attester.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Attester.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'mode' => {'type'=>'code', 'path'=>'Attester.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/composition-attestation-mode|4.0.0', 'uri'=>nil}},
        'time' => {'type'=>'dateTime', 'path'=>'Attester.time', 'min'=>0, 'max'=>1},
        'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Attester.party', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :mode              # 1-1 code
      attr_accessor :time              # 0-1 dateTime
      attr_accessor :party             # 0-1 Reference(Patient|RelatedPerson|Practitioner|PractitionerRole|Organization)
    end

    class RelatesTo < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'target' => ['Identifier', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'RelatesTo.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'RelatesTo.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatesTo.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'code', 'path'=>'RelatesTo.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/document-relationship-type|4.0.0', 'uri'=>nil}},
        'targetIdentifier' => {'type'=>'Identifier', 'path'=>'RelatesTo.target[x]', 'min'=>1, 'max'=>1},
        'targetReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Composition'], 'type'=>'Reference', 'path'=>'RelatesTo.target[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 code
      attr_accessor :targetIdentifier  # 1-1 Identifier
      attr_accessor :targetReference   # 1-1 Reference(Composition)
    end

    class Event < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Event.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Event.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Event.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Event.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActCode', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'Event.period', 'min'=>0, 'max'=>1},
        'detail' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Event.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 0-* [ CodeableConcept ]
      attr_accessor :period            # 0-1 Period
      attr_accessor :detail            # 0-* [ Reference(Resource) ]
    end

    class Section < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Section.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Section.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Section.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'title' => {'type'=>'string', 'path'=>'Section.title', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Section.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/doc-section-codes', 'uri'=>nil}},
        'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Section.author', 'min'=>0, 'max'=>Float::INFINITY},
        'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Section.focus', 'min'=>0, 'max'=>1},
        'text' => {'type'=>'Narrative', 'path'=>'Section.text', 'min'=>0, 'max'=>1},
        'mode' => {'type'=>'code', 'path'=>'Section.mode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/list-mode|4.0.0', 'uri'=>nil}},
        'orderedBy' => {'type'=>'CodeableConcept', 'path'=>'Section.orderedBy', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/list-order', 'uri'=>nil}},
        'entry' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Section.entry', 'min'=>0, 'max'=>Float::INFINITY},
        'emptyReason' => {'type'=>'CodeableConcept', 'path'=>'Section.emptyReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/list-empty-reason', 'uri'=>nil}},
        'section' => {'type'=>'Composition::Section', 'path'=>'Section.section', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :title             # 0-1 string
      attr_accessor :code              # 0-1 CodeableConcept
      attr_accessor :author            # 0-* [ Reference(Practitioner|PractitionerRole|Device|Patient|RelatedPerson|Organization) ]
      attr_accessor :focus             # 0-1 Reference(Resource)
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :mode              # 0-1 code
      attr_accessor :orderedBy         # 0-1 CodeableConcept
      attr_accessor :entry             # 0-* [ Reference(Resource) ]
      attr_accessor :emptyReason       # 0-1 CodeableConcept
      attr_accessor :section           # 0-* [ Composition::Section ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-1 Identifier
    attr_accessor :status            # 1-1 code
    attr_accessor :type              # 1-1 CodeableConcept
    attr_accessor :category          # 0-* [ CodeableConcept ]
    attr_accessor :subject           # 0-1 Reference(Resource)
    attr_accessor :encounter         # 0-1 Reference(Encounter)
    attr_accessor :date              # 1-1 dateTime
    attr_accessor :author            # 1-* [ Reference(Practitioner|PractitionerRole|Device|Patient|RelatedPerson|Organization) ]
    attr_accessor :title             # 1-1 string
    attr_accessor :confidentiality   # 0-1 code
    attr_accessor :attester          # 0-* [ Composition::Attester ]
    attr_accessor :custodian         # 0-1 Reference(Organization)
    attr_accessor :relatesTo         # 0-* [ Composition::RelatesTo ]
    attr_accessor :event             # 0-* [ Composition::Event ]
    attr_accessor :section           # 0-* [ Composition::Section ]

    def resourceType
      'Composition'
    end
  end
end