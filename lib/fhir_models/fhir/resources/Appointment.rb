module FHIR
  class Appointment < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['actor', 'appointment-type', 'based-on', 'date', 'identifier', 'location', 'part-status', 'patient', 'practitioner', 'reason-code', 'reason-reference', 'service-category', 'service-type', 'slot', 'specialty', 'status', 'supporting-info']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Appointment.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Appointment.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Appointment.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Appointment.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Appointment.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Appointment.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Appointment.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Appointment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Appointment.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Appointment.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/appointmentstatus|4.0.0', 'uri'=>nil}},
      'cancelationReason' => {'type'=>'CodeableConcept', 'path'=>'Appointment.cancelationReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/appointment-cancellation-reason', 'uri'=>nil}},
      'serviceCategory' => {'type'=>'CodeableConcept', 'path'=>'Appointment.serviceCategory', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-category', 'uri'=>nil}},
      'serviceType' => {'type'=>'CodeableConcept', 'path'=>'Appointment.serviceType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-type', 'uri'=>nil}},
      'specialty' => {'type'=>'CodeableConcept', 'path'=>'Appointment.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes', 'uri'=>nil}},
      'appointmentType' => {'type'=>'CodeableConcept', 'path'=>'Appointment.appointmentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0276', 'uri'=>nil}},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'Appointment.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-reason', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation'], 'type'=>'Reference', 'path'=>'Appointment.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'priority' => {'type'=>'unsignedInt', 'path'=>'Appointment.priority', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'Appointment.description', 'min'=>0, 'max'=>1},
      'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Appointment.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
      'start' => {'type'=>'instant', 'path'=>'Appointment.start', 'min'=>0, 'max'=>1},
      'end' => {'type'=>'instant', 'path'=>'Appointment.end', 'min'=>0, 'max'=>1},
      'minutesDuration' => {'type'=>'positiveInt', 'path'=>'Appointment.minutesDuration', 'min'=>0, 'max'=>1},
      'slot' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Slot'], 'type'=>'Reference', 'path'=>'Appointment.slot', 'min'=>0, 'max'=>Float::INFINITY},
      'created' => {'type'=>'dateTime', 'path'=>'Appointment.created', 'min'=>0, 'max'=>1},
      'comment' => {'type'=>'string', 'path'=>'Appointment.comment', 'min'=>0, 'max'=>1},
      'patientInstruction' => {'type'=>'string', 'path'=>'Appointment.patientInstruction', 'min'=>0, 'max'=>1},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'Appointment.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'participant' => {'type'=>'Appointment::Participant', 'path'=>'Appointment.participant', 'min'=>1, 'max'=>Float::INFINITY},
      'requestedPeriod' => {'type'=>'Period', 'path'=>'Appointment.requestedPeriod', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Participant < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Participant.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Participant.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Participant.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Participant.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-participant-type', 'uri'=>nil}},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Participant.actor', 'min'=>0, 'max'=>1},
        'required' => {'type'=>'code', 'path'=>'Participant.required', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/participantrequired|4.0.0', 'uri'=>nil}},
        'status' => {'type'=>'code', 'path'=>'Participant.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/participationstatus|4.0.0', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'Participant.period', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-* [ CodeableConcept ]
      attr_accessor :actor             # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Device|HealthcareService|Location)
      attr_accessor :required          # 0-1 code
      attr_accessor :status            # 1-1 code
      attr_accessor :period            # 0-1 Period
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
    attr_accessor :status                # 1-1 code
    attr_accessor :cancelationReason     # 0-1 CodeableConcept
    attr_accessor :serviceCategory       # 0-* [ CodeableConcept ]
    attr_accessor :serviceType           # 0-* [ CodeableConcept ]
    attr_accessor :specialty             # 0-* [ CodeableConcept ]
    attr_accessor :appointmentType       # 0-1 CodeableConcept
    attr_accessor :reasonCode            # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference       # 0-* [ Reference(Condition|Procedure|Observation|ImmunizationRecommendation) ]
    attr_accessor :priority              # 0-1 unsignedInt
    attr_accessor :description           # 0-1 string
    attr_accessor :supportingInformation # 0-* [ Reference(Resource) ]
    attr_accessor :start                 # 0-1 instant
    attr_accessor :end                   # 0-1 instant
    attr_accessor :minutesDuration       # 0-1 positiveInt
    attr_accessor :slot                  # 0-* [ Reference(Slot) ]
    attr_accessor :created               # 0-1 dateTime
    attr_accessor :comment               # 0-1 string
    attr_accessor :patientInstruction    # 0-1 string
    attr_accessor :basedOn               # 0-* [ Reference(ServiceRequest) ]
    attr_accessor :participant           # 1-* [ Appointment::Participant ]
    attr_accessor :requestedPeriod       # 0-* [ Period ]

    def resourceType
      'Appointment'
    end
  end
end