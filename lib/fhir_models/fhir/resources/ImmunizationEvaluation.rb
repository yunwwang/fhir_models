module FHIR
  class ImmunizationEvaluation < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'doseNumber' => ['positiveInt', 'string'],
      'seriesDoses' => ['positiveInt', 'string']
    }
    SEARCH_PARAMS = ['date', 'dose-status', 'identifier', 'immunization-event', 'patient', 'status', 'target-disease']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ImmunizationEvaluation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ImmunizationEvaluation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ImmunizationEvaluation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ImmunizationEvaluation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ImmunizationEvaluation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ImmunizationEvaluation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ImmunizationEvaluation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ImmunizationEvaluation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ImmunizationEvaluation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'ImmunizationEvaluation.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-evaluation-status|4.0.0', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ImmunizationEvaluation.patient', 'min'=>1, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ImmunizationEvaluation.date', 'min'=>0, 'max'=>1},
      'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ImmunizationEvaluation.authority', 'min'=>0, 'max'=>1},
      'targetDisease' => {'type'=>'CodeableConcept', 'path'=>'ImmunizationEvaluation.targetDisease', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-evaluation-target-disease', 'uri'=>nil}},
      'immunizationEvent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Immunization'], 'type'=>'Reference', 'path'=>'ImmunizationEvaluation.immunizationEvent', 'min'=>1, 'max'=>1},
      'doseStatus' => {'type'=>'CodeableConcept', 'path'=>'ImmunizationEvaluation.doseStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-evaluation-dose-status', 'uri'=>nil}},
      'doseStatusReason' => {'type'=>'CodeableConcept', 'path'=>'ImmunizationEvaluation.doseStatusReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-evaluation-dose-status-reason', 'uri'=>nil}},
      'description' => {'type'=>'string', 'path'=>'ImmunizationEvaluation.description', 'min'=>0, 'max'=>1},
      'series' => {'type'=>'string', 'path'=>'ImmunizationEvaluation.series', 'min'=>0, 'max'=>1},
      'doseNumberPositiveInt' => {'type'=>'positiveInt', 'path'=>'ImmunizationEvaluation.doseNumber[x]', 'min'=>0, 'max'=>1},
      'doseNumberString' => {'type'=>'string', 'path'=>'ImmunizationEvaluation.doseNumber[x]', 'min'=>0, 'max'=>1},
      'seriesDosesPositiveInt' => {'type'=>'positiveInt', 'path'=>'ImmunizationEvaluation.seriesDoses[x]', 'min'=>0, 'max'=>1},
      'seriesDosesString' => {'type'=>'string', 'path'=>'ImmunizationEvaluation.seriesDoses[x]', 'min'=>0, 'max'=>1}
    }

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :status                 # 1-1 code
    attr_accessor :patient                # 1-1 Reference(Patient)
    attr_accessor :date                   # 0-1 dateTime
    attr_accessor :authority              # 0-1 Reference(Organization)
    attr_accessor :targetDisease          # 1-1 CodeableConcept
    attr_accessor :immunizationEvent      # 1-1 Reference(Immunization)
    attr_accessor :doseStatus             # 1-1 CodeableConcept
    attr_accessor :doseStatusReason       # 0-* [ CodeableConcept ]
    attr_accessor :description            # 0-1 string
    attr_accessor :series                 # 0-1 string
    attr_accessor :doseNumberPositiveInt  # 0-1 positiveInt
    attr_accessor :doseNumberString       # 0-1 string
    attr_accessor :seriesDosesPositiveInt # 0-1 positiveInt
    attr_accessor :seriesDosesString      # 0-1 string

    def resourceType
      'ImmunizationEvaluation'
    end
  end
end