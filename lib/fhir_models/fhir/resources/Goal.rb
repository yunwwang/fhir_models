module FHIR
  class Goal < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'start' => ['date', 'CodeableConcept']
    }
    SEARCH_PARAMS = ['identifier', 'patient', 'achievement-status', 'category', 'lifecycle-status', 'start-date', 'subject', 'target-date']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Goal.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Goal.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Goal.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Goal.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Goal.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Goal.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Goal.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Goal.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Goal.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'lifecycleStatus' => {'type'=>'code', 'path'=>'Goal.lifecycleStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/goal-status|4.0.0', 'uri'=>nil}},
      'achievementStatus' => {'type'=>'CodeableConcept', 'path'=>'Goal.achievementStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/goal-achievement', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'Goal.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/goal-category', 'uri'=>nil}},
      'priority' => {'type'=>'CodeableConcept', 'path'=>'Goal.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/goal-priority', 'uri'=>nil}},
      'description' => {'type'=>'CodeableConcept', 'path'=>'Goal.description', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinical-findings', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Goal.subject', 'min'=>1, 'max'=>1},
      'startDate' => {'type'=>'date', 'path'=>'Goal.start[x]', 'min'=>0, 'max'=>1},
      'startCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Goal.start[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/goal-start-event', 'uri'=>nil}},
      'target' => {'type'=>'Goal::Target', 'path'=>'Goal.target', 'min'=>0, 'max'=>Float::INFINITY},
      'statusDate' => {'type'=>'date', 'path'=>'Goal.statusDate', 'min'=>0, 'max'=>1},
      'statusReason' => {'type'=>'string', 'path'=>'Goal.statusReason', 'min'=>0, 'max'=>1},
      'expressedBy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Goal.expressedBy', 'min'=>0, 'max'=>1},
      'addresses' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/MedicationStatement', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/RiskAssessment'], 'type'=>'Reference', 'path'=>'Goal.addresses', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'Goal.note', 'min'=>0, 'max'=>Float::INFINITY},
      'outcomeCode' => {'type'=>'CodeableConcept', 'path'=>'Goal.outcomeCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinical-findings', 'uri'=>nil}},
      'outcomeReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Goal.outcomeReference', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Target < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'detail' => ['Quantity', 'Range', 'CodeableConcept', 'string', 'boolean', 'integer', 'Ratio'],
        'due' => ['date', 'Duration']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'measure' => {'type'=>'CodeableConcept', 'path'=>'Target.measure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-codes', 'uri'=>nil}},
        'detailQuantity' => {'type'=>'Quantity', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
        'detailRange' => {'type'=>'Range', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
        'detailCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'detailString' => {'type'=>'string', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
        'detailBoolean' => {'type'=>'boolean', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
        'detailInteger' => {'type'=>'integer', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
        'detailRatio' => {'type'=>'Ratio', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
        'dueDate' => {'type'=>'date', 'path'=>'Target.due[x]', 'min'=>0, 'max'=>1},
        'dueDuration' => {'type'=>'Duration', 'path'=>'Target.due[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                    # 0-1 string
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :measure               # 0-1 CodeableConcept
      attr_accessor :detailQuantity        # 0-1 Quantity
      attr_accessor :detailRange           # 0-1 Range
      attr_accessor :detailCodeableConcept # 0-1 CodeableConcept
      attr_accessor :detailString          # 0-1 string
      attr_accessor :detailBoolean         # 0-1 boolean
      attr_accessor :detailInteger         # 0-1 integer
      attr_accessor :detailRatio           # 0-1 Ratio
      attr_accessor :dueDate               # 0-1 date
      attr_accessor :dueDuration           # 0-1 Duration
    end

    attr_accessor :id                   # 0-1 id
    attr_accessor :meta                 # 0-1 Meta
    attr_accessor :implicitRules        # 0-1 uri
    attr_accessor :language             # 0-1 code
    attr_accessor :text                 # 0-1 Narrative
    attr_accessor :contained            # 0-* [ Resource ]
    attr_accessor :extension            # 0-* [ Extension ]
    attr_accessor :modifierExtension    # 0-* [ Extension ]
    attr_accessor :identifier           # 0-* [ Identifier ]
    attr_accessor :lifecycleStatus      # 1-1 code
    attr_accessor :achievementStatus    # 0-1 CodeableConcept
    attr_accessor :category             # 0-* [ CodeableConcept ]
    attr_accessor :priority             # 0-1 CodeableConcept
    attr_accessor :description          # 1-1 CodeableConcept
    attr_accessor :subject              # 1-1 Reference(Patient|Group|Organization)
    attr_accessor :startDate            # 0-1 date
    attr_accessor :startCodeableConcept # 0-1 CodeableConcept
    attr_accessor :target               # 0-* [ Goal::Target ]
    attr_accessor :statusDate           # 0-1 date
    attr_accessor :statusReason         # 0-1 string
    attr_accessor :expressedBy          # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson)
    attr_accessor :addresses            # 0-* [ Reference(Condition|Observation|MedicationStatement|NutritionOrder|ServiceRequest|RiskAssessment) ]
    attr_accessor :note                 # 0-* [ Annotation ]
    attr_accessor :outcomeCode          # 0-* [ CodeableConcept ]
    attr_accessor :outcomeReference     # 0-* [ Reference(Observation) ]

    def resourceType
      'Goal'
    end
  end
end