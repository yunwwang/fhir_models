module FHIR
  class CarePlan < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'identifier', 'patient', 'activity-code', 'activity-date', 'activity-reference', 'based-on', 'care-team', 'category', 'condition', 'encounter', 'goal', 'instantiates-canonical', 'instantiates-uri', 'intent', 'part-of', 'performer', 'replaces', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'CarePlan.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'CarePlan.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'CarePlan.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'CarePlan.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'CarePlan.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'CarePlan.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'CarePlan.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'CarePlan.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'CarePlan.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'CarePlan.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesUri' => {'type'=>'uri', 'path'=>'CarePlan.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan'], 'type'=>'Reference', 'path'=>'CarePlan.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'replaces' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan'], 'type'=>'Reference', 'path'=>'CarePlan.replaces', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan'], 'type'=>'Reference', 'path'=>'CarePlan.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'CarePlan.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-status|4.0.0', 'uri'=>nil}},
      'intent' => {'type'=>'code', 'path'=>'CarePlan.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/care-plan-intent|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'CarePlan.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/care-plan-category', 'uri'=>nil}},
      'title' => {'type'=>'string', 'path'=>'CarePlan.title', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'CarePlan.description', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'CarePlan.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'CarePlan.encounter', 'min'=>0, 'max'=>1},
      'period' => {'type'=>'Period', 'path'=>'CarePlan.period', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'CarePlan.created', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'CarePlan.author', 'min'=>0, 'max'=>1},
      'contributor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'CarePlan.contributor', 'min'=>0, 'max'=>Float::INFINITY},
      'careTeam' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'CarePlan.careTeam', 'min'=>0, 'max'=>Float::INFINITY},
      'addresses' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'CarePlan.addresses', 'min'=>0, 'max'=>Float::INFINITY},
      'supportingInfo' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'CarePlan.supportingInfo', 'min'=>0, 'max'=>Float::INFINITY},
      'goal' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Goal'], 'type'=>'Reference', 'path'=>'CarePlan.goal', 'min'=>0, 'max'=>Float::INFINITY},
      'activity' => {'type'=>'CarePlan::Activity', 'path'=>'CarePlan.activity', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'CarePlan.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Activity < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Activity.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Activity.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Activity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'outcomeCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Activity.outcomeCodeableConcept', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/care-plan-activity-outcome', 'uri'=>nil}},
        'outcomeReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Activity.outcomeReference', 'min'=>0, 'max'=>Float::INFINITY},
        'progress' => {'type'=>'Annotation', 'path'=>'Activity.progress', 'min'=>0, 'max'=>Float::INFINITY},
        'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Appointment', 'http://hl7.org/fhir/StructureDefinition/CommunicationRequest', 'http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/Task', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription', 'http://hl7.org/fhir/StructureDefinition/RequestGroup'], 'type'=>'Reference', 'path'=>'Activity.reference', 'min'=>0, 'max'=>1},
        'detail' => {'type'=>'CarePlan::Activity::Detail', 'path'=>'Activity.detail', 'min'=>0, 'max'=>1}
      }

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'scheduled' => ['Timing', 'Period', 'string'],
          'product' => ['CodeableConcept', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'kind' => {'type'=>'code', 'path'=>'Detail.kind', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/care-plan-activity-kind|4.0.0', 'uri'=>nil}},
          'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'Detail.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
          'instantiatesUri' => {'type'=>'uri', 'path'=>'Detail.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'type'=>'CodeableConcept', 'path'=>'Detail.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-code', 'uri'=>nil}},
          'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'Detail.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinical-findings', 'uri'=>nil}},
          'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'Detail.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
          'goal' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Goal'], 'type'=>'Reference', 'path'=>'Detail.goal', 'min'=>0, 'max'=>Float::INFINITY},
          'status' => {'type'=>'code', 'path'=>'Detail.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/care-plan-activity-status|4.0.0', 'uri'=>nil}},
          'statusReason' => {'type'=>'CodeableConcept', 'path'=>'Detail.statusReason', 'min'=>0, 'max'=>1},
          'doNotPerform' => {'type'=>'boolean', 'path'=>'Detail.doNotPerform', 'min'=>0, 'max'=>1},
          'scheduledTiming' => {'type'=>'Timing', 'path'=>'Detail.scheduled[x]', 'min'=>0, 'max'=>1},
          'scheduledPeriod' => {'type'=>'Period', 'path'=>'Detail.scheduled[x]', 'min'=>0, 'max'=>1},
          'scheduledString' => {'type'=>'string', 'path'=>'Detail.scheduled[x]', 'min'=>0, 'max'=>1},
          'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Detail.location', 'min'=>0, 'max'=>1},
          'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Detail.performer', 'min'=>0, 'max'=>Float::INFINITY},
          'productCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Detail.product[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-codes', 'uri'=>nil}},
          'productReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Detail.product[x]', 'min'=>0, 'max'=>1},
          'dailyAmount' => {'type'=>'Quantity', 'path'=>'Detail.dailyAmount', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Detail.description', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                     # 0-1 string
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :kind                   # 0-1 code
        attr_accessor :instantiatesCanonical  # 0-* [ canonical ]
        attr_accessor :instantiatesUri        # 0-* [ uri ]
        attr_accessor :code                   # 0-1 CodeableConcept
        attr_accessor :reasonCode             # 0-* [ CodeableConcept ]
        attr_accessor :reasonReference        # 0-* [ Reference(Condition|Observation|DiagnosticReport|DocumentReference) ]
        attr_accessor :goal                   # 0-* [ Reference(Goal) ]
        attr_accessor :status                 # 1-1 code
        attr_accessor :statusReason           # 0-1 CodeableConcept
        attr_accessor :doNotPerform           # 0-1 boolean
        attr_accessor :scheduledTiming        # 0-1 Timing
        attr_accessor :scheduledPeriod        # 0-1 Period
        attr_accessor :scheduledString        # 0-1 string
        attr_accessor :location               # 0-1 Reference(Location)
        attr_accessor :performer              # 0-* [ Reference(Practitioner|PractitionerRole|Organization|RelatedPerson|Patient|CareTeam|HealthcareService|Device) ]
        attr_accessor :productCodeableConcept # 0-1 CodeableConcept
        attr_accessor :productReference       # 0-1 Reference(Medication|Substance)
        attr_accessor :dailyAmount            # 0-1 Quantity
        attr_accessor :quantity               # 0-1 Quantity
        attr_accessor :description            # 0-1 string
      end

      attr_accessor :id                     # 0-1 string
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :outcomeCodeableConcept # 0-* [ CodeableConcept ]
      attr_accessor :outcomeReference       # 0-* [ Reference(Resource) ]
      attr_accessor :progress               # 0-* [ Annotation ]
      attr_accessor :reference              # 0-1 Reference(Appointment|CommunicationRequest|DeviceRequest|MedicationRequest|NutritionOrder|Task|ServiceRequest|VisionPrescription|RequestGroup)
      attr_accessor :detail                 # 0-1 CarePlan::Activity::Detail
    end

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :identifier            # 0-* [ Identifier ]
    attr_accessor :instantiatesCanonical # 0-* [ canonical ]
    attr_accessor :instantiatesUri       # 0-* [ uri ]
    attr_accessor :basedOn               # 0-* [ Reference(CarePlan) ]
    attr_accessor :replaces              # 0-* [ Reference(CarePlan) ]
    attr_accessor :partOf                # 0-* [ Reference(CarePlan) ]
    attr_accessor :status                # 1-1 code
    attr_accessor :intent                # 1-1 code
    attr_accessor :category              # 0-* [ CodeableConcept ]
    attr_accessor :title                 # 0-1 string
    attr_accessor :description           # 0-1 string
    attr_accessor :subject               # 1-1 Reference(Patient|Group)
    attr_accessor :encounter             # 0-1 Reference(Encounter)
    attr_accessor :period                # 0-1 Period
    attr_accessor :created               # 0-1 dateTime
    attr_accessor :author                # 0-1 Reference(Patient|Practitioner|PractitionerRole|Device|RelatedPerson|Organization|CareTeam)
    attr_accessor :contributor           # 0-* [ Reference(Patient|Practitioner|PractitionerRole|Device|RelatedPerson|Organization|CareTeam) ]
    attr_accessor :careTeam              # 0-* [ Reference(CareTeam) ]
    attr_accessor :addresses             # 0-* [ Reference(Condition) ]
    attr_accessor :supportingInfo        # 0-* [ Reference(Resource) ]
    attr_accessor :goal                  # 0-* [ Reference(Goal) ]
    attr_accessor :activity              # 0-* [ CarePlan::Activity ]
    attr_accessor :note                  # 0-* [ Annotation ]

    def resourceType
      'CarePlan'
    end
  end
end