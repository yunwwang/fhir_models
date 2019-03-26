module FHIR
  class MedicationDispense < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'statusReason' => ['CodeableConcept', 'Reference'],
      'medication' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['code', 'identifier', 'patient', 'medication', 'status', 'context', 'destination', 'performer', 'prescription', 'receiver', 'responsibleparty', 'subject', 'type', 'whenhandedover', 'whenprepared']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicationDispense.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicationDispense.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicationDispense.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MedicationDispense.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicationDispense.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicationDispense.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicationDispense.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationDispense.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'MedicationDispense.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'MedicationDispense.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'MedicationDispense.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationdispense-status|4.0.0', 'uri'=>nil}},
      'statusReasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'MedicationDispense.statusReason[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationdispense-status-reason', 'uri'=>nil}},
      'statusReasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DetectedIssue'], 'type'=>'Reference', 'path'=>'MedicationDispense.statusReason[x]', 'min'=>0, 'max'=>1},
      'category' => {'type'=>'CodeableConcept', 'path'=>'MedicationDispense.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationdispense-category', 'uri'=>nil}},
      'medicationCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'MedicationDispense.medication[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-codes', 'uri'=>nil}},
      'medicationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicationDispense.medication[x]', 'min'=>1, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationDispense.subject', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'MedicationDispense.context', 'min'=>0, 'max'=>1},
      'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationDispense.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
      'performer' => {'type'=>'MedicationDispense::Performer', 'path'=>'MedicationDispense.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'MedicationDispense.location', 'min'=>0, 'max'=>1},
      'authorizingPrescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'MedicationDispense.authorizingPrescription', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'type'=>'CodeableConcept', 'path'=>'MedicationDispense.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActPharmacySupplyType', 'uri'=>nil}},
      'quantity' => {'type'=>'Quantity', 'path'=>'MedicationDispense.quantity', 'min'=>0, 'max'=>1},
      'daysSupply' => {'type'=>'Quantity', 'path'=>'MedicationDispense.daysSupply', 'min'=>0, 'max'=>1},
      'whenPrepared' => {'type'=>'dateTime', 'path'=>'MedicationDispense.whenPrepared', 'min'=>0, 'max'=>1},
      'whenHandedOver' => {'type'=>'dateTime', 'path'=>'MedicationDispense.whenHandedOver', 'min'=>0, 'max'=>1},
      'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'MedicationDispense.destination', 'min'=>0, 'max'=>1},
      'receiver' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'MedicationDispense.receiver', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'MedicationDispense.note', 'min'=>0, 'max'=>Float::INFINITY},
      'dosageInstruction' => {'type'=>'Dosage', 'path'=>'MedicationDispense.dosageInstruction', 'min'=>0, 'max'=>Float::INFINITY},
      'substitution' => {'type'=>'MedicationDispense::Substitution', 'path'=>'MedicationDispense.substitution', 'min'=>0, 'max'=>1},
      'detectedIssue' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DetectedIssue'], 'type'=>'Reference', 'path'=>'MedicationDispense.detectedIssue', 'min'=>0, 'max'=>Float::INFINITY},
      'eventHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'MedicationDispense.eventHistory', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Performer < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'function' => {'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationdispense-performer-function', 'uri'=>nil}},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :function          # 0-1 CodeableConcept
      attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|Patient|Device|RelatedPerson)
    end

    class Substitution < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Substitution.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Substitution.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Substitution.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'wasSubstituted' => {'type'=>'boolean', 'path'=>'Substitution.wasSubstituted', 'min'=>1, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Substitution.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActSubstanceAdminSubstitutionCode', 'uri'=>nil}},
        'reason' => {'type'=>'CodeableConcept', 'path'=>'Substitution.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-SubstanceAdminSubstitutionReason', 'uri'=>nil}},
        'responsibleParty' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Substitution.responsibleParty', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :wasSubstituted    # 1-1 boolean
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :reason            # 0-* [ CodeableConcept ]
      attr_accessor :responsibleParty  # 0-* [ Reference(Practitioner|PractitionerRole) ]
    end

    attr_accessor :id                          # 0-1 id
    attr_accessor :meta                        # 0-1 Meta
    attr_accessor :implicitRules               # 0-1 uri
    attr_accessor :language                    # 0-1 code
    attr_accessor :text                        # 0-1 Narrative
    attr_accessor :contained                   # 0-* [ Resource ]
    attr_accessor :extension                   # 0-* [ Extension ]
    attr_accessor :modifierExtension           # 0-* [ Extension ]
    attr_accessor :identifier                  # 0-* [ Identifier ]
    attr_accessor :partOf                      # 0-* [ Reference(Procedure) ]
    attr_accessor :status                      # 1-1 code
    attr_accessor :statusReasonCodeableConcept # 0-1 CodeableConcept
    attr_accessor :statusReasonReference       # 0-1 Reference(DetectedIssue)
    attr_accessor :category                    # 0-1 CodeableConcept
    attr_accessor :medicationCodeableConcept   # 1-1 CodeableConcept
    attr_accessor :medicationReference         # 1-1 Reference(Medication)
    attr_accessor :subject                     # 0-1 Reference(Patient|Group)
    attr_accessor :context                     # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :supportingInformation       # 0-* [ Reference(Resource) ]
    attr_accessor :performer                   # 0-* [ MedicationDispense::Performer ]
    attr_accessor :location                    # 0-1 Reference(Location)
    attr_accessor :authorizingPrescription     # 0-* [ Reference(MedicationRequest) ]
    attr_accessor :type                        # 0-1 CodeableConcept
    attr_accessor :quantity                    # 0-1 Quantity
    attr_accessor :daysSupply                  # 0-1 Quantity
    attr_accessor :whenPrepared                # 0-1 dateTime
    attr_accessor :whenHandedOver              # 0-1 dateTime
    attr_accessor :destination                 # 0-1 Reference(Location)
    attr_accessor :receiver                    # 0-* [ Reference(Patient|Practitioner) ]
    attr_accessor :note                        # 0-* [ Annotation ]
    attr_accessor :dosageInstruction           # 0-* [ Dosage ]
    attr_accessor :substitution                # 0-1 MedicationDispense::Substitution
    attr_accessor :detectedIssue               # 0-* [ Reference(DetectedIssue) ]
    attr_accessor :eventHistory                # 0-* [ Reference(Provenance) ]

    def resourceType
      'MedicationDispense'
    end
  end
end