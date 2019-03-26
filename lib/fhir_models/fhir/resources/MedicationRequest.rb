module FHIR
  class MedicationRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'reported' => ['boolean', 'Reference'],
      'medication' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['code', 'identifier', 'patient', 'medication', 'status', 'authoredon', 'category', 'date', 'encounter', 'intended-dispenser', 'intended-performer', 'intended-performertype', 'intent', 'priority', 'requester', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicationRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicationRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicationRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MedicationRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicationRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicationRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicationRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'MedicationRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'MedicationRequest.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationrequest-status|4.0.0', 'uri'=>nil}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'MedicationRequest.statusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationrequest-status-reason', 'uri'=>nil}},
      'intent' => {'type'=>'code', 'path'=>'MedicationRequest.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationrequest-intent|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'MedicationRequest.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationrequest-category', 'uri'=>nil}},
      'priority' => {'type'=>'code', 'path'=>'MedicationRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-priority|4.0.0', 'uri'=>nil}},
      'doNotPerform' => {'type'=>'boolean', 'path'=>'MedicationRequest.doNotPerform', 'min'=>0, 'max'=>1},
      'reportedBoolean' => {'type'=>'boolean', 'path'=>'MedicationRequest.reported[x]', 'min'=>0, 'max'=>1},
      'reportedReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'MedicationRequest.reported[x]', 'min'=>0, 'max'=>1},
      'medicationCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'MedicationRequest.medication[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-codes', 'uri'=>nil}},
      'medicationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicationRequest.medication[x]', 'min'=>1, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationRequest.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'MedicationRequest.encounter', 'min'=>0, 'max'=>1},
      'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationRequest.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
      'authoredOn' => {'type'=>'dateTime', 'path'=>'MedicationRequest.authoredOn', 'min'=>0, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'MedicationRequest.requester', 'min'=>0, 'max'=>1},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'MedicationRequest.performer', 'min'=>0, 'max'=>1},
      'performerType' => {'type'=>'CodeableConcept', 'path'=>'MedicationRequest.performerType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/performer-role', 'uri'=>nil}},
      'recorder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'MedicationRequest.recorder', 'min'=>0, 'max'=>1},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'MedicationRequest.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'MedicationRequest.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'MedicationRequest.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesUri' => {'type'=>'uri', 'path'=>'MedicationRequest.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation'], 'type'=>'Reference', 'path'=>'MedicationRequest.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'groupIdentifier' => {'type'=>'Identifier', 'path'=>'MedicationRequest.groupIdentifier', 'min'=>0, 'max'=>1},
      'courseOfTherapyType' => {'type'=>'CodeableConcept', 'path'=>'MedicationRequest.courseOfTherapyType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationrequest-course-of-therapy', 'uri'=>nil}},
      'insurance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage', 'http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'MedicationRequest.insurance', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'MedicationRequest.note', 'min'=>0, 'max'=>Float::INFINITY},
      'dosageInstruction' => {'type'=>'Dosage', 'path'=>'MedicationRequest.dosageInstruction', 'min'=>0, 'max'=>Float::INFINITY},
      'dispenseRequest' => {'type'=>'MedicationRequest::DispenseRequest', 'path'=>'MedicationRequest.dispenseRequest', 'min'=>0, 'max'=>1},
      'substitution' => {'type'=>'MedicationRequest::Substitution', 'path'=>'MedicationRequest.substitution', 'min'=>0, 'max'=>1},
      'priorPrescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'MedicationRequest.priorPrescription', 'min'=>0, 'max'=>1},
      'detectedIssue' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DetectedIssue'], 'type'=>'Reference', 'path'=>'MedicationRequest.detectedIssue', 'min'=>0, 'max'=>Float::INFINITY},
      'eventHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'MedicationRequest.eventHistory', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class DispenseRequest < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DispenseRequest.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DispenseRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DispenseRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'initialFill' => {'type'=>'MedicationRequest::DispenseRequest::InitialFill', 'path'=>'DispenseRequest.initialFill', 'min'=>0, 'max'=>1},
        'dispenseInterval' => {'type'=>'Duration', 'path'=>'DispenseRequest.dispenseInterval', 'min'=>0, 'max'=>1},
        'validityPeriod' => {'type'=>'Period', 'path'=>'DispenseRequest.validityPeriod', 'min'=>0, 'max'=>1},
        'numberOfRepeatsAllowed' => {'type'=>'unsignedInt', 'path'=>'DispenseRequest.numberOfRepeatsAllowed', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'DispenseRequest.quantity', 'min'=>0, 'max'=>1},
        'expectedSupplyDuration' => {'type'=>'Duration', 'path'=>'DispenseRequest.expectedSupplyDuration', 'min'=>0, 'max'=>1},
        'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DispenseRequest.performer', 'min'=>0, 'max'=>1}
      }

      class InitialFill < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'InitialFill.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'InitialFill.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'InitialFill.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'quantity' => {'type'=>'Quantity', 'path'=>'InitialFill.quantity', 'min'=>0, 'max'=>1},
          'duration' => {'type'=>'Duration', 'path'=>'InitialFill.duration', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :quantity          # 0-1 Quantity
        attr_accessor :duration          # 0-1 Duration
      end

      attr_accessor :id                     # 0-1 string
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :initialFill            # 0-1 MedicationRequest::DispenseRequest::InitialFill
      attr_accessor :dispenseInterval       # 0-1 Duration
      attr_accessor :validityPeriod         # 0-1 Period
      attr_accessor :numberOfRepeatsAllowed # 0-1 unsignedInt
      attr_accessor :quantity               # 0-1 Quantity
      attr_accessor :expectedSupplyDuration # 0-1 Duration
      attr_accessor :performer              # 0-1 Reference(Organization)
    end

    class Substitution < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'allowed' => ['boolean', 'CodeableConcept']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Substitution.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Substitution.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Substitution.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'allowedBoolean' => {'type'=>'boolean', 'path'=>'Substitution.allowed[x]', 'min'=>1, 'max'=>1},
        'allowedCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Substitution.allowed[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActSubstanceAdminSubstitutionCode', 'uri'=>nil}},
        'reason' => {'type'=>'CodeableConcept', 'path'=>'Substitution.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-SubstanceAdminSubstitutionReason', 'uri'=>nil}}
      }

      attr_accessor :id                     # 0-1 string
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :allowedBoolean         # 1-1 boolean
      attr_accessor :allowedCodeableConcept # 1-1 CodeableConcept
      attr_accessor :reason                 # 0-1 CodeableConcept
    end

    attr_accessor :id                        # 0-1 id
    attr_accessor :meta                      # 0-1 Meta
    attr_accessor :implicitRules             # 0-1 uri
    attr_accessor :language                  # 0-1 code
    attr_accessor :text                      # 0-1 Narrative
    attr_accessor :contained                 # 0-* [ Resource ]
    attr_accessor :extension                 # 0-* [ Extension ]
    attr_accessor :modifierExtension         # 0-* [ Extension ]
    attr_accessor :identifier                # 0-* [ Identifier ]
    attr_accessor :status                    # 1-1 code
    attr_accessor :statusReason              # 0-1 CodeableConcept
    attr_accessor :intent                    # 1-1 code
    attr_accessor :category                  # 0-* [ CodeableConcept ]
    attr_accessor :priority                  # 0-1 code
    attr_accessor :doNotPerform              # 0-1 boolean
    attr_accessor :reportedBoolean           # 0-1 boolean
    attr_accessor :reportedReference         # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Organization)
    attr_accessor :medicationCodeableConcept # 1-1 CodeableConcept
    attr_accessor :medicationReference       # 1-1 Reference(Medication)
    attr_accessor :subject                   # 1-1 Reference(Patient|Group)
    attr_accessor :encounter                 # 0-1 Reference(Encounter)
    attr_accessor :supportingInformation     # 0-* [ Reference(Resource) ]
    attr_accessor :authoredOn                # 0-1 dateTime
    attr_accessor :requester                 # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson|Device)
    attr_accessor :performer                 # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|Device|RelatedPerson|CareTeam)
    attr_accessor :performerType             # 0-1 CodeableConcept
    attr_accessor :recorder                  # 0-1 Reference(Practitioner|PractitionerRole)
    attr_accessor :reasonCode                # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference           # 0-* [ Reference(Condition|Observation) ]
    attr_accessor :instantiatesCanonical     # 0-* [ canonical ]
    attr_accessor :instantiatesUri           # 0-* [ uri ]
    attr_accessor :basedOn                   # 0-* [ Reference(CarePlan|MedicationRequest|ServiceRequest|ImmunizationRecommendation) ]
    attr_accessor :groupIdentifier           # 0-1 Identifier
    attr_accessor :courseOfTherapyType       # 0-1 CodeableConcept
    attr_accessor :insurance                 # 0-* [ Reference(Coverage|ClaimResponse) ]
    attr_accessor :note                      # 0-* [ Annotation ]
    attr_accessor :dosageInstruction         # 0-* [ Dosage ]
    attr_accessor :dispenseRequest           # 0-1 MedicationRequest::DispenseRequest
    attr_accessor :substitution              # 0-1 MedicationRequest::Substitution
    attr_accessor :priorPrescription         # 0-1 Reference(MedicationRequest)
    attr_accessor :detectedIssue             # 0-* [ Reference(DetectedIssue) ]
    attr_accessor :eventHistory              # 0-* [ Reference(Provenance) ]

    def resourceType
      'MedicationRequest'
    end
  end
end