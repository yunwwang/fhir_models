module FHIR
  class AdverseEvent < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['actuality', 'category', 'date', 'event', 'location', 'recorder', 'resultingcondition', 'seriousness', 'severity', 'study', 'subject', 'substance']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'AdverseEvent.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'AdverseEvent.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'AdverseEvent.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'AdverseEvent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'AdverseEvent.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'AdverseEvent.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'AdverseEvent.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'AdverseEvent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'AdverseEvent.identifier', 'min'=>0, 'max'=>1},
      'actuality' => {'type'=>'code', 'path'=>'AdverseEvent.actuality', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adverse-event-actuality|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'AdverseEvent.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adverse-event-category', 'uri'=>nil}},
      'event' => {'type'=>'CodeableConcept', 'path'=>'AdverseEvent.event', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adverse-event-type', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'AdverseEvent.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'AdverseEvent.encounter', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'AdverseEvent.date', 'min'=>0, 'max'=>1},
      'detected' => {'type'=>'dateTime', 'path'=>'AdverseEvent.detected', 'min'=>0, 'max'=>1},
      'recordedDate' => {'type'=>'dateTime', 'path'=>'AdverseEvent.recordedDate', 'min'=>0, 'max'=>1},
      'resultingCondition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'AdverseEvent.resultingCondition', 'min'=>0, 'max'=>Float::INFINITY},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'AdverseEvent.location', 'min'=>0, 'max'=>1},
      'seriousness' => {'type'=>'CodeableConcept', 'path'=>'AdverseEvent.seriousness', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adverse-event-seriousness', 'uri'=>nil}},
      'severity' => {'type'=>'CodeableConcept', 'path'=>'AdverseEvent.severity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adverse-event-severity|4.0.0', 'uri'=>nil}},
      'outcome' => {'type'=>'CodeableConcept', 'path'=>'AdverseEvent.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adverse-event-outcome|4.0.0', 'uri'=>nil}},
      'recorder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'AdverseEvent.recorder', 'min'=>0, 'max'=>1},
      'contributor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'AdverseEvent.contributor', 'min'=>0, 'max'=>Float::INFINITY},
      'suspectEntity' => {'type'=>'AdverseEvent::SuspectEntity', 'path'=>'AdverseEvent.suspectEntity', 'min'=>0, 'max'=>Float::INFINITY},
      'subjectMedicalHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/AllergyIntolerance', 'http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory', 'http://hl7.org/fhir/StructureDefinition/Immunization', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Media', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'AdverseEvent.subjectMedicalHistory', 'min'=>0, 'max'=>Float::INFINITY},
      'referenceDocument' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'AdverseEvent.referenceDocument', 'min'=>0, 'max'=>Float::INFINITY},
      'study' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ResearchStudy'], 'type'=>'Reference', 'path'=>'AdverseEvent.study', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class SuspectEntity < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'SuspectEntity.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'SuspectEntity.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SuspectEntity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'instance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Immunization', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/MedicationAdministration', 'http://hl7.org/fhir/StructureDefinition/MedicationStatement', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SuspectEntity.instance', 'min'=>1, 'max'=>1},
        'causality' => {'type'=>'AdverseEvent::SuspectEntity::Causality', 'path'=>'SuspectEntity.causality', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Causality < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Causality.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Causality.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Causality.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'assessment' => {'type'=>'CodeableConcept', 'path'=>'Causality.assessment', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adverse-event-causality-assess', 'uri'=>nil}},
          'productRelatedness' => {'type'=>'string', 'path'=>'Causality.productRelatedness', 'min'=>0, 'max'=>1},
          'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Causality.author', 'min'=>0, 'max'=>1},
          'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'Causality.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adverse-event-causality-method', 'uri'=>nil}}
        }

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :assessment         # 0-1 CodeableConcept
        attr_accessor :productRelatedness # 0-1 string
        attr_accessor :author             # 0-1 Reference(Practitioner|PractitionerRole)
        attr_accessor :local_method       # 0-1 CodeableConcept
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :instance          # 1-1 Reference(Immunization|Procedure|Substance|Medication|MedicationAdministration|MedicationStatement|Device)
      attr_accessor :causality         # 0-* [ AdverseEvent::SuspectEntity::Causality ]
    end

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :identifier            # 0-1 Identifier
    attr_accessor :actuality             # 1-1 code
    attr_accessor :category              # 0-* [ CodeableConcept ]
    attr_accessor :event                 # 0-1 CodeableConcept
    attr_accessor :subject               # 1-1 Reference(Patient|Group|Practitioner|RelatedPerson)
    attr_accessor :encounter             # 0-1 Reference(Encounter)
    attr_accessor :date                  # 0-1 dateTime
    attr_accessor :detected              # 0-1 dateTime
    attr_accessor :recordedDate          # 0-1 dateTime
    attr_accessor :resultingCondition    # 0-* [ Reference(Condition) ]
    attr_accessor :location              # 0-1 Reference(Location)
    attr_accessor :seriousness           # 0-1 CodeableConcept
    attr_accessor :severity              # 0-1 CodeableConcept
    attr_accessor :outcome               # 0-1 CodeableConcept
    attr_accessor :recorder              # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson)
    attr_accessor :contributor           # 0-* [ Reference(Practitioner|PractitionerRole|Device) ]
    attr_accessor :suspectEntity         # 0-* [ AdverseEvent::SuspectEntity ]
    attr_accessor :subjectMedicalHistory # 0-* [ Reference(Condition|Observation|AllergyIntolerance|FamilyMemberHistory|Immunization|Procedure|Media|DocumentReference) ]
    attr_accessor :referenceDocument     # 0-* [ Reference(DocumentReference) ]
    attr_accessor :study                 # 0-* [ Reference(ResearchStudy) ]

    def resourceType
      'AdverseEvent'
    end
  end
end