module FHIR
  class DeviceRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'code' => ['Reference', 'CodeableConcept'],
      'occurrence' => ['dateTime', 'Period', 'Timing']
    }
    SEARCH_PARAMS = ['code', 'identifier', 'patient', 'encounter', 'authored-on', 'based-on', 'device', 'event-date', 'group-identifier', 'instantiates-canonical', 'instantiates-uri', 'insurance', 'intent', 'performer', 'prior-request', 'requester', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DeviceRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DeviceRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DeviceRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DeviceRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'DeviceRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DeviceRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DeviceRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'DeviceRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'DeviceRequest.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesUri' => {'type'=>'uri', 'path'=>'DeviceRequest.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceRequest.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'priorRequest' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceRequest.priorRequest', 'min'=>0, 'max'=>Float::INFINITY},
      'groupIdentifier' => {'type'=>'Identifier', 'path'=>'DeviceRequest.groupIdentifier', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'DeviceRequest.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-status|4.0.0', 'uri'=>nil}},
      'intent' => {'type'=>'code', 'path'=>'DeviceRequest.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-intent|4.0.0', 'uri'=>nil}},
      'priority' => {'type'=>'code', 'path'=>'DeviceRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-priority|4.0.0', 'uri'=>nil}},
      'codeReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DeviceRequest.code[x]', 'min'=>1, 'max'=>1},
      'codeCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'DeviceRequest.code[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-kind', 'uri'=>nil}},
      'parameter' => {'type'=>'DeviceRequest::Parameter', 'path'=>'DeviceRequest.parameter', 'min'=>0, 'max'=>Float::INFINITY},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DeviceRequest.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'DeviceRequest.encounter', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'DeviceRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrencePeriod' => {'type'=>'Period', 'path'=>'DeviceRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrenceTiming' => {'type'=>'Timing', 'path'=>'DeviceRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'authoredOn' => {'type'=>'dateTime', 'path'=>'DeviceRequest.authoredOn', 'min'=>0, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DeviceRequest.requester', 'min'=>0, 'max'=>1},
      'performerType' => {'type'=>'CodeableConcept', 'path'=>'DeviceRequest.performerType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/participant-role', 'uri'=>nil}},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'DeviceRequest.performer', 'min'=>0, 'max'=>1},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'DeviceRequest.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'DeviceRequest.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'insurance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage', 'http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'DeviceRequest.insurance', 'min'=>0, 'max'=>Float::INFINITY},
      'supportingInfo' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceRequest.supportingInfo', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'DeviceRequest.note', 'min'=>0, 'max'=>Float::INFINITY},
      'relevantHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'DeviceRequest.relevantHistory', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Parameter < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['CodeableConcept', 'Quantity', 'Range', 'boolean']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Parameter.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :code                 # 0-1 CodeableConcept
      attr_accessor :valueCodeableConcept # 0-1 CodeableConcept
      attr_accessor :valueQuantity        # 0-1 Quantity
      attr_accessor :valueRange           # 0-1 Range
      attr_accessor :valueBoolean         # 0-1 boolean
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
    attr_accessor :basedOn               # 0-* [ Reference(Resource) ]
    attr_accessor :priorRequest          # 0-* [ Reference(Resource) ]
    attr_accessor :groupIdentifier       # 0-1 Identifier
    attr_accessor :status                # 0-1 code
    attr_accessor :intent                # 1-1 code
    attr_accessor :priority              # 0-1 code
    attr_accessor :codeReference         # 1-1 Reference(Device)
    attr_accessor :codeCodeableConcept   # 1-1 CodeableConcept
    attr_accessor :parameter             # 0-* [ DeviceRequest::Parameter ]
    attr_accessor :subject               # 1-1 Reference(Patient|Group|Location|Device)
    attr_accessor :encounter             # 0-1 Reference(Encounter)
    attr_accessor :occurrenceDateTime    # 0-1 dateTime
    attr_accessor :occurrencePeriod      # 0-1 Period
    attr_accessor :occurrenceTiming      # 0-1 Timing
    attr_accessor :authoredOn            # 0-1 dateTime
    attr_accessor :requester             # 0-1 Reference(Device|Practitioner|PractitionerRole|Organization)
    attr_accessor :performerType         # 0-1 CodeableConcept
    attr_accessor :performer             # 0-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|HealthcareService|Patient|Device|RelatedPerson)
    attr_accessor :reasonCode            # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference       # 0-* [ Reference(Condition|Observation|DiagnosticReport|DocumentReference) ]
    attr_accessor :insurance             # 0-* [ Reference(Coverage|ClaimResponse) ]
    attr_accessor :supportingInfo        # 0-* [ Reference(Resource) ]
    attr_accessor :note                  # 0-* [ Annotation ]
    attr_accessor :relevantHistory       # 0-* [ Reference(Provenance) ]

    def resourceType
      'DeviceRequest'
    end
  end
end