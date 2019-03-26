module FHIR
  class ServiceRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'quantity' => ['Quantity', 'Ratio', 'Range'],
      'occurrence' => ['dateTime', 'Period', 'Timing'],
      'asNeeded' => ['boolean', 'CodeableConcept']
    }
    SEARCH_PARAMS = ['code', 'identifier', 'patient', 'encounter', 'authored', 'based-on', 'body-site', 'category', 'instantiates-canonical', 'instantiates-uri', 'intent', 'occurrence', 'performer', 'performer-type', 'priority', 'replaces', 'requester', 'requisition', 'specimen', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ServiceRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ServiceRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ServiceRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ServiceRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ServiceRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ServiceRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ServiceRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ServiceRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ServiceRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'ServiceRequest.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesUri' => {'type'=>'uri', 'path'=>'ServiceRequest.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'ServiceRequest.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'replaces' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'ServiceRequest.replaces', 'min'=>0, 'max'=>Float::INFINITY},
      'requisition' => {'type'=>'Identifier', 'path'=>'ServiceRequest.requisition', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'ServiceRequest.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-status|4.0.0', 'uri'=>nil}},
      'intent' => {'type'=>'code', 'path'=>'ServiceRequest.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-intent|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'ServiceRequest.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/servicerequest-category', 'uri'=>nil}},
      'priority' => {'type'=>'code', 'path'=>'ServiceRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-priority|4.0.0', 'uri'=>nil}},
      'doNotPerform' => {'type'=>'boolean', 'path'=>'ServiceRequest.doNotPerform', 'min'=>0, 'max'=>1},
      'code' => {'type'=>'CodeableConcept', 'path'=>'ServiceRequest.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-code', 'uri'=>nil}},
      'orderDetail' => {'type'=>'CodeableConcept', 'path'=>'ServiceRequest.orderDetail', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/servicerequest-orderdetail', 'uri'=>nil}},
      'quantityQuantity' => {'type'=>'Quantity', 'path'=>'ServiceRequest.quantity[x]', 'min'=>0, 'max'=>1},
      'quantityRatio' => {'type'=>'Ratio', 'path'=>'ServiceRequest.quantity[x]', 'min'=>0, 'max'=>1},
      'quantityRange' => {'type'=>'Range', 'path'=>'ServiceRequest.quantity[x]', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'ServiceRequest.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'ServiceRequest.encounter', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'ServiceRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrencePeriod' => {'type'=>'Period', 'path'=>'ServiceRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrenceTiming' => {'type'=>'Timing', 'path'=>'ServiceRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'asNeededBoolean' => {'type'=>'boolean', 'path'=>'ServiceRequest.asNeeded[x]', 'min'=>0, 'max'=>1},
      'asNeededCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ServiceRequest.asNeeded[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-as-needed-reason', 'uri'=>nil}},
      'authoredOn' => {'type'=>'dateTime', 'path'=>'ServiceRequest.authoredOn', 'min'=>0, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'ServiceRequest.requester', 'min'=>0, 'max'=>1},
      'performerType' => {'type'=>'CodeableConcept', 'path'=>'ServiceRequest.performerType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/participant-role', 'uri'=>nil}},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'ServiceRequest.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'locationCode' => {'type'=>'CodeableConcept', 'path'=>'ServiceRequest.locationCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType', 'uri'=>nil}},
      'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'ServiceRequest.locationReference', 'min'=>0, 'max'=>Float::INFINITY},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'ServiceRequest.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-reason', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'ServiceRequest.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'insurance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage', 'http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'ServiceRequest.insurance', 'min'=>0, 'max'=>Float::INFINITY},
      'supportingInfo' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ServiceRequest.supportingInfo', 'min'=>0, 'max'=>Float::INFINITY},
      'specimen' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'ServiceRequest.specimen', 'min'=>0, 'max'=>Float::INFINITY},
      'bodySite' => {'type'=>'CodeableConcept', 'path'=>'ServiceRequest.bodySite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'note' => {'type'=>'Annotation', 'path'=>'ServiceRequest.note', 'min'=>0, 'max'=>Float::INFINITY},
      'patientInstruction' => {'type'=>'string', 'path'=>'ServiceRequest.patientInstruction', 'min'=>0, 'max'=>1},
      'relevantHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'ServiceRequest.relevantHistory', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                      # 0-1 id
    attr_accessor :meta                    # 0-1 Meta
    attr_accessor :implicitRules           # 0-1 uri
    attr_accessor :language                # 0-1 code
    attr_accessor :text                    # 0-1 Narrative
    attr_accessor :contained               # 0-* [ Resource ]
    attr_accessor :extension               # 0-* [ Extension ]
    attr_accessor :modifierExtension       # 0-* [ Extension ]
    attr_accessor :identifier              # 0-* [ Identifier ]
    attr_accessor :instantiatesCanonical   # 0-* [ canonical ]
    attr_accessor :instantiatesUri         # 0-* [ uri ]
    attr_accessor :basedOn                 # 0-* [ Reference(CarePlan|ServiceRequest|MedicationRequest) ]
    attr_accessor :replaces                # 0-* [ Reference(ServiceRequest) ]
    attr_accessor :requisition             # 0-1 Identifier
    attr_accessor :status                  # 1-1 code
    attr_accessor :intent                  # 1-1 code
    attr_accessor :category                # 0-* [ CodeableConcept ]
    attr_accessor :priority                # 0-1 code
    attr_accessor :doNotPerform            # 0-1 boolean
    attr_accessor :code                    # 0-1 CodeableConcept
    attr_accessor :orderDetail             # 0-* [ CodeableConcept ]
    attr_accessor :quantityQuantity        # 0-1 Quantity
    attr_accessor :quantityRatio           # 0-1 Ratio
    attr_accessor :quantityRange           # 0-1 Range
    attr_accessor :subject                 # 1-1 Reference(Patient|Group|Location|Device)
    attr_accessor :encounter               # 0-1 Reference(Encounter)
    attr_accessor :occurrenceDateTime      # 0-1 dateTime
    attr_accessor :occurrencePeriod        # 0-1 Period
    attr_accessor :occurrenceTiming        # 0-1 Timing
    attr_accessor :asNeededBoolean         # 0-1 boolean
    attr_accessor :asNeededCodeableConcept # 0-1 CodeableConcept
    attr_accessor :authoredOn              # 0-1 dateTime
    attr_accessor :requester               # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson|Device)
    attr_accessor :performerType           # 0-1 CodeableConcept
    attr_accessor :performer               # 0-* [ Reference(Practitioner|PractitionerRole|Organization|CareTeam|HealthcareService|Patient|Device|RelatedPerson) ]
    attr_accessor :locationCode            # 0-* [ CodeableConcept ]
    attr_accessor :locationReference       # 0-* [ Reference(Location) ]
    attr_accessor :reasonCode              # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference         # 0-* [ Reference(Condition|Observation|DiagnosticReport|DocumentReference) ]
    attr_accessor :insurance               # 0-* [ Reference(Coverage|ClaimResponse) ]
    attr_accessor :supportingInfo          # 0-* [ Reference(Resource) ]
    attr_accessor :specimen                # 0-* [ Reference(Specimen) ]
    attr_accessor :bodySite                # 0-* [ CodeableConcept ]
    attr_accessor :note                    # 0-* [ Annotation ]
    attr_accessor :patientInstruction      # 0-1 string
    attr_accessor :relevantHistory         # 0-* [ Reference(Provenance) ]

    def resourceType
      'ServiceRequest'
    end
  end
end