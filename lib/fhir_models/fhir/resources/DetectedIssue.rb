module FHIR
  class DetectedIssue < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'identified' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ['identifier', 'patient', 'author', 'code', 'identified', 'implicated']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DetectedIssue.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DetectedIssue.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DetectedIssue.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DetectedIssue.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'DetectedIssue.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DetectedIssue.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DetectedIssue.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DetectedIssue.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'DetectedIssue.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'DetectedIssue.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-status|4.0.0', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'DetectedIssue.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/detectedissue-category', 'uri'=>nil}},
      'severity' => {'type'=>'code', 'path'=>'DetectedIssue.severity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/detectedissue-severity|4.0.0', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'DetectedIssue.patient', 'min'=>0, 'max'=>1},
      'identifiedDateTime' => {'type'=>'dateTime', 'path'=>'DetectedIssue.identified[x]', 'min'=>0, 'max'=>1},
      'identifiedPeriod' => {'type'=>'Period', 'path'=>'DetectedIssue.identified[x]', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DetectedIssue.author', 'min'=>0, 'max'=>1},
      'implicated' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DetectedIssue.implicated', 'min'=>0, 'max'=>Float::INFINITY},
      'evidence' => {'type'=>'DetectedIssue::Evidence', 'path'=>'DetectedIssue.evidence', 'min'=>0, 'max'=>Float::INFINITY},
      'detail' => {'type'=>'string', 'path'=>'DetectedIssue.detail', 'min'=>0, 'max'=>1},
      'reference' => {'type'=>'uri', 'path'=>'DetectedIssue.reference', 'min'=>0, 'max'=>1},
      'mitigation' => {'type'=>'DetectedIssue::Mitigation', 'path'=>'DetectedIssue.mitigation', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Evidence < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Evidence.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Evidence.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Evidence.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Evidence.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/manifestation-or-symptom', 'uri'=>nil}},
        'detail' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Evidence.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 0-* [ CodeableConcept ]
      attr_accessor :detail            # 0-* [ Reference(Resource) ]
    end

    class Mitigation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Mitigation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Mitigation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Mitigation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'action' => {'type'=>'CodeableConcept', 'path'=>'Mitigation.action', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/detectedissue-mitigation-action', 'uri'=>nil}},
        'date' => {'type'=>'dateTime', 'path'=>'Mitigation.date', 'min'=>0, 'max'=>1},
        'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Mitigation.author', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :action            # 1-1 CodeableConcept
      attr_accessor :date              # 0-1 dateTime
      attr_accessor :author            # 0-1 Reference(Practitioner|PractitionerRole)
    end

    attr_accessor :id                 # 0-1 id
    attr_accessor :meta               # 0-1 Meta
    attr_accessor :implicitRules      # 0-1 uri
    attr_accessor :language           # 0-1 code
    attr_accessor :text               # 0-1 Narrative
    attr_accessor :contained          # 0-* [ Resource ]
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :modifierExtension  # 0-* [ Extension ]
    attr_accessor :identifier         # 0-* [ Identifier ]
    attr_accessor :status             # 1-1 code
    attr_accessor :code               # 0-1 CodeableConcept
    attr_accessor :severity           # 0-1 code
    attr_accessor :patient            # 0-1 Reference(Patient)
    attr_accessor :identifiedDateTime # 0-1 dateTime
    attr_accessor :identifiedPeriod   # 0-1 Period
    attr_accessor :author             # 0-1 Reference(Practitioner|PractitionerRole|Device)
    attr_accessor :implicated         # 0-* [ Reference(Resource) ]
    attr_accessor :evidence           # 0-* [ DetectedIssue::Evidence ]
    attr_accessor :detail             # 0-1 string
    attr_accessor :reference          # 0-1 uri
    attr_accessor :mitigation         # 0-* [ DetectedIssue::Mitigation ]

    def resourceType
      'DetectedIssue'
    end
  end
end