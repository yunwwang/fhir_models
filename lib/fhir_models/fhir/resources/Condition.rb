module FHIR
  class Condition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'onset' => ['dateTime', 'Age', 'Period', 'Range', 'string'],
      'abatement' => ['dateTime', 'Age', 'Period', 'Range', 'string']
    }
    SEARCH_PARAMS = ['code', 'identifier', 'patient', 'abatement-age', 'abatement-date', 'abatement-string', 'asserter', 'body-site', 'category', 'clinical-status', 'encounter', 'evidence', 'evidence-detail', 'onset-age', 'onset-date', 'onset-info', 'recorded-date', 'severity', 'stage', 'subject', 'verification-status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Condition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Condition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Condition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Condition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Condition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Condition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Condition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Condition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Condition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'clinicalStatus' => {'type'=>'CodeableConcept', 'path'=>'Condition.clinicalStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-clinical|4.0.0', 'uri'=>nil}},
      'verificationStatus' => {'type'=>'CodeableConcept', 'path'=>'Condition.verificationStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-ver-status|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'Condition.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-category', 'uri'=>nil}},
      'severity' => {'type'=>'CodeableConcept', 'path'=>'Condition.severity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-severity', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'Condition.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
      'bodySite' => {'type'=>'CodeableConcept', 'path'=>'Condition.bodySite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Condition.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Condition.encounter', 'min'=>0, 'max'=>1},
      'onsetDateTime' => {'type'=>'dateTime', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
      'onsetAge' => {'type'=>'Age', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
      'onsetPeriod' => {'type'=>'Period', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
      'onsetRange' => {'type'=>'Range', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
      'onsetString' => {'type'=>'string', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
      'abatementDateTime' => {'type'=>'dateTime', 'path'=>'Condition.abatement[x]', 'min'=>0, 'max'=>1},
      'abatementAge' => {'type'=>'Age', 'path'=>'Condition.abatement[x]', 'min'=>0, 'max'=>1},
      'abatementPeriod' => {'type'=>'Period', 'path'=>'Condition.abatement[x]', 'min'=>0, 'max'=>1},
      'abatementRange' => {'type'=>'Range', 'path'=>'Condition.abatement[x]', 'min'=>0, 'max'=>1},
      'abatementString' => {'type'=>'string', 'path'=>'Condition.abatement[x]', 'min'=>0, 'max'=>1},
      'recordedDate' => {'type'=>'dateTime', 'path'=>'Condition.recordedDate', 'min'=>0, 'max'=>1},
      'recorder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Condition.recorder', 'min'=>0, 'max'=>1},
      'asserter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Condition.asserter', 'min'=>0, 'max'=>1},
      'stage' => {'type'=>'Condition::Stage', 'path'=>'Condition.stage', 'min'=>0, 'max'=>Float::INFINITY},
      'evidence' => {'type'=>'Condition::Evidence', 'path'=>'Condition.evidence', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'Condition.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Stage < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Stage.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Stage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Stage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'summary' => {'type'=>'CodeableConcept', 'path'=>'Stage.summary', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-stage', 'uri'=>nil}},
        'assessment' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClinicalImpression', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Stage.assessment', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Stage.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-stage-type', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :summary           # 0-1 CodeableConcept
      attr_accessor :assessment        # 0-* [ Reference(ClinicalImpression|DiagnosticReport|Observation) ]
      attr_accessor :type              # 0-1 CodeableConcept
    end

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

    attr_accessor :id                 # 0-1 id
    attr_accessor :meta               # 0-1 Meta
    attr_accessor :implicitRules      # 0-1 uri
    attr_accessor :language           # 0-1 code
    attr_accessor :text               # 0-1 Narrative
    attr_accessor :contained          # 0-* [ Resource ]
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :modifierExtension  # 0-* [ Extension ]
    attr_accessor :identifier         # 0-* [ Identifier ]
    attr_accessor :clinicalStatus     # 0-1 CodeableConcept
    attr_accessor :verificationStatus # 0-1 CodeableConcept
    attr_accessor :category           # 0-* [ CodeableConcept ]
    attr_accessor :severity           # 0-1 CodeableConcept
    attr_accessor :code               # 0-1 CodeableConcept
    attr_accessor :bodySite           # 0-* [ CodeableConcept ]
    attr_accessor :subject            # 1-1 Reference(Patient|Group)
    attr_accessor :encounter          # 0-1 Reference(Encounter)
    attr_accessor :onsetDateTime      # 0-1 dateTime
    attr_accessor :onsetAge           # 0-1 Age
    attr_accessor :onsetPeriod        # 0-1 Period
    attr_accessor :onsetRange         # 0-1 Range
    attr_accessor :onsetString        # 0-1 string
    attr_accessor :abatementDateTime  # 0-1 dateTime
    attr_accessor :abatementAge       # 0-1 Age
    attr_accessor :abatementPeriod    # 0-1 Period
    attr_accessor :abatementRange     # 0-1 Range
    attr_accessor :abatementString    # 0-1 string
    attr_accessor :recordedDate       # 0-1 dateTime
    attr_accessor :recorder           # 0-1 Reference(Practitioner|PractitionerRole|Patient|RelatedPerson)
    attr_accessor :asserter           # 0-1 Reference(Practitioner|PractitionerRole|Patient|RelatedPerson)
    attr_accessor :stage              # 0-* [ Condition::Stage ]
    attr_accessor :evidence           # 0-* [ Condition::Evidence ]
    attr_accessor :note               # 0-* [ Annotation ]

    def resourceType
      'Condition'
    end
  end
end