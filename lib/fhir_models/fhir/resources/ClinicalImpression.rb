module FHIR
  class ClinicalImpression < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'effective' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ['date', 'patient', 'assessor', 'encounter', 'finding-code', 'finding-ref', 'identifier', 'investigation', 'previous', 'problem', 'status', 'subject', 'supporting-info']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ClinicalImpression.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ClinicalImpression.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ClinicalImpression.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ClinicalImpression.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ClinicalImpression.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ClinicalImpression.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ClinicalImpression.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ClinicalImpression.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ClinicalImpression.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'ClinicalImpression.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinicalimpression-status|4.0.0', 'uri'=>nil}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'ClinicalImpression.statusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'ClinicalImpression.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'description' => {'type'=>'string', 'path'=>'ClinicalImpression.description', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'ClinicalImpression.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'ClinicalImpression.encounter', 'min'=>0, 'max'=>1},
      'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'ClinicalImpression.effective[x]', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'ClinicalImpression.effective[x]', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ClinicalImpression.date', 'min'=>0, 'max'=>1},
      'assessor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'ClinicalImpression.assessor', 'min'=>0, 'max'=>1},
      'previous' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClinicalImpression'], 'type'=>'Reference', 'path'=>'ClinicalImpression.previous', 'min'=>0, 'max'=>1},
      'problem' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/AllergyIntolerance'], 'type'=>'Reference', 'path'=>'ClinicalImpression.problem', 'min'=>0, 'max'=>Float::INFINITY},
      'investigation' => {'type'=>'ClinicalImpression::Investigation', 'path'=>'ClinicalImpression.investigation', 'min'=>0, 'max'=>Float::INFINITY},
      'protocol' => {'type'=>'uri', 'path'=>'ClinicalImpression.protocol', 'min'=>0, 'max'=>Float::INFINITY},
      'summary' => {'type'=>'string', 'path'=>'ClinicalImpression.summary', 'min'=>0, 'max'=>1},
      'finding' => {'type'=>'ClinicalImpression::Finding', 'path'=>'ClinicalImpression.finding', 'min'=>0, 'max'=>Float::INFINITY},
      'prognosisCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ClinicalImpression.prognosisCodeableConcept', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinicalimpression-prognosis', 'uri'=>nil}},
      'prognosisReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/RiskAssessment'], 'type'=>'Reference', 'path'=>'ClinicalImpression.prognosisReference', 'min'=>0, 'max'=>Float::INFINITY},
      'supportingInfo' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ClinicalImpression.supportingInfo', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'ClinicalImpression.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Investigation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Investigation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Investigation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Investigation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Investigation.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/investigation-sets', 'uri'=>nil}},
        'item' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse', 'http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/RiskAssessment', 'http://hl7.org/fhir/StructureDefinition/ImagingStudy', 'http://hl7.org/fhir/StructureDefinition/Media'], 'type'=>'Reference', 'path'=>'Investigation.item', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 CodeableConcept
      attr_accessor :item              # 0-* [ Reference(Observation|QuestionnaireResponse|FamilyMemberHistory|DiagnosticReport|RiskAssessment|ImagingStudy|Media) ]
    end

    class Finding < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Finding.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Finding.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Finding.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'itemCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Finding.itemCodeableConcept', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
        'itemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/Media'], 'type'=>'Reference', 'path'=>'Finding.itemReference', 'min'=>0, 'max'=>1},
        'basis' => {'type'=>'string', 'path'=>'Finding.basis', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :itemCodeableConcept # 0-1 CodeableConcept
      attr_accessor :itemReference       # 0-1 Reference(Condition|Observation|Media)
      attr_accessor :basis               # 0-1 string
    end

    attr_accessor :id                       # 0-1 id
    attr_accessor :meta                     # 0-1 Meta
    attr_accessor :implicitRules            # 0-1 uri
    attr_accessor :language                 # 0-1 code
    attr_accessor :text                     # 0-1 Narrative
    attr_accessor :contained                # 0-* [ Resource ]
    attr_accessor :extension                # 0-* [ Extension ]
    attr_accessor :modifierExtension        # 0-* [ Extension ]
    attr_accessor :identifier               # 0-* [ Identifier ]
    attr_accessor :status                   # 1-1 code
    attr_accessor :statusReason             # 0-1 CodeableConcept
    attr_accessor :code                     # 0-1 CodeableConcept
    attr_accessor :description              # 0-1 string
    attr_accessor :subject                  # 1-1 Reference(Patient|Group)
    attr_accessor :encounter                # 0-1 Reference(Encounter)
    attr_accessor :effectiveDateTime        # 0-1 dateTime
    attr_accessor :effectivePeriod          # 0-1 Period
    attr_accessor :date                     # 0-1 dateTime
    attr_accessor :assessor                 # 0-1 Reference(Practitioner|PractitionerRole)
    attr_accessor :previous                 # 0-1 Reference(ClinicalImpression)
    attr_accessor :problem                  # 0-* [ Reference(Condition|AllergyIntolerance) ]
    attr_accessor :investigation            # 0-* [ ClinicalImpression::Investigation ]
    attr_accessor :protocol                 # 0-* [ uri ]
    attr_accessor :summary                  # 0-1 string
    attr_accessor :finding                  # 0-* [ ClinicalImpression::Finding ]
    attr_accessor :prognosisCodeableConcept # 0-* [ CodeableConcept ]
    attr_accessor :prognosisReference       # 0-* [ Reference(RiskAssessment) ]
    attr_accessor :supportingInfo           # 0-* [ Reference(Resource) ]
    attr_accessor :note                     # 0-* [ Annotation ]

    def resourceType
      'ClinicalImpression'
    end
  end
end