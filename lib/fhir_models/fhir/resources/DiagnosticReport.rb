module FHIR
  class DiagnosticReport < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'effective' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ['code', 'date', 'identifier', 'patient', 'encounter', 'based-on', 'category', 'conclusion', 'issued', 'media', 'performer', 'result', 'results-interpreter', 'specimen', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DiagnosticReport.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DiagnosticReport.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DiagnosticReport.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DiagnosticReport.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'DiagnosticReport.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DiagnosticReport.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DiagnosticReport.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DiagnosticReport.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'DiagnosticReport.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'DiagnosticReport.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'DiagnosticReport.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/diagnostic-report-status|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'DiagnosticReport.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/diagnostic-service-sections', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'DiagnosticReport.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/report-codes', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'DiagnosticReport.subject', 'min'=>0, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'DiagnosticReport.encounter', 'min'=>0, 'max'=>1},
      'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'DiagnosticReport.effective[x]', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'DiagnosticReport.effective[x]', 'min'=>0, 'max'=>1},
      'issued' => {'type'=>'instant', 'path'=>'DiagnosticReport.issued', 'min'=>0, 'max'=>1},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'DiagnosticReport.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'resultsInterpreter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'DiagnosticReport.resultsInterpreter', 'min'=>0, 'max'=>Float::INFINITY},
      'specimen' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'DiagnosticReport.specimen', 'min'=>0, 'max'=>Float::INFINITY},
      'result' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'DiagnosticReport.result', 'min'=>0, 'max'=>Float::INFINITY},
      'imagingStudy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ImagingStudy'], 'type'=>'Reference', 'path'=>'DiagnosticReport.imagingStudy', 'min'=>0, 'max'=>Float::INFINITY},
      'media' => {'type'=>'DiagnosticReport::Media', 'path'=>'DiagnosticReport.media', 'min'=>0, 'max'=>Float::INFINITY},
      'conclusion' => {'type'=>'string', 'path'=>'DiagnosticReport.conclusion', 'min'=>0, 'max'=>1},
      'conclusionCode' => {'type'=>'CodeableConcept', 'path'=>'DiagnosticReport.conclusionCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinical-findings', 'uri'=>nil}},
      'presentedForm' => {'type'=>'Attachment', 'path'=>'DiagnosticReport.presentedForm', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Media < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Media.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Media.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Media.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'comment' => {'type'=>'string', 'path'=>'Media.comment', 'min'=>0, 'max'=>1},
        'link' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Media'], 'type'=>'Reference', 'path'=>'Media.link', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :comment           # 0-1 string
      attr_accessor :link              # 1-1 Reference(Media)
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
    attr_accessor :basedOn            # 0-* [ Reference(CarePlan|ImmunizationRecommendation|MedicationRequest|NutritionOrder|ServiceRequest) ]
    attr_accessor :status             # 1-1 code
    attr_accessor :category           # 0-* [ CodeableConcept ]
    attr_accessor :code               # 1-1 CodeableConcept
    attr_accessor :subject            # 0-1 Reference(Patient|Group|Device|Location)
    attr_accessor :encounter          # 0-1 Reference(Encounter)
    attr_accessor :effectiveDateTime  # 0-1 dateTime
    attr_accessor :effectivePeriod    # 0-1 Period
    attr_accessor :issued             # 0-1 instant
    attr_accessor :performer          # 0-* [ Reference(Practitioner|PractitionerRole|Organization|CareTeam) ]
    attr_accessor :resultsInterpreter # 0-* [ Reference(Practitioner|PractitionerRole|Organization|CareTeam) ]
    attr_accessor :specimen           # 0-* [ Reference(Specimen) ]
    attr_accessor :result             # 0-* [ Reference(Observation) ]
    attr_accessor :imagingStudy       # 0-* [ Reference(ImagingStudy) ]
    attr_accessor :media              # 0-* [ DiagnosticReport::Media ]
    attr_accessor :conclusion         # 0-1 string
    attr_accessor :conclusionCode     # 0-* [ CodeableConcept ]
    attr_accessor :presentedForm      # 0-* [ Attachment ]

    def resourceType
      'DiagnosticReport'
    end
  end
end