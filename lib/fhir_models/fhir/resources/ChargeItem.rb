module FHIR
  class ChargeItem < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'occurrence' => ['dateTime', 'Period', 'Timing'],
      'product' => ['Reference', 'CodeableConcept']
    }
    SEARCH_PARAMS = ['account', 'code', 'context', 'entered-date', 'enterer', 'factor-override', 'identifier', 'occurrence', 'patient', 'performer-actor', 'performer-function', 'performing-organization', 'price-override', 'quantity', 'requesting-organization', 'service', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ChargeItem.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ChargeItem.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ChargeItem.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ChargeItem.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ChargeItem.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ChargeItem.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ChargeItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ChargeItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ChargeItem.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'definitionUri' => {'type'=>'uri', 'path'=>'ChargeItem.definitionUri', 'min'=>0, 'max'=>Float::INFINITY},
      'definitionCanonical' => {'type'=>'canonical', 'path'=>'ChargeItem.definitionCanonical', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'ChargeItem.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/chargeitem-status|4.0.0', 'uri'=>nil}},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ChargeItem'], 'type'=>'Reference', 'path'=>'ChargeItem.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'code' => {'type'=>'CodeableConcept', 'path'=>'ChargeItem.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/chargeitem-billingcodes', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'ChargeItem.subject', 'min'=>1, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'ChargeItem.context', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'ChargeItem.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrencePeriod' => {'type'=>'Period', 'path'=>'ChargeItem.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrenceTiming' => {'type'=>'Timing', 'path'=>'ChargeItem.occurrence[x]', 'min'=>0, 'max'=>1},
      'performer' => {'type'=>'ChargeItem::Performer', 'path'=>'ChargeItem.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'performingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ChargeItem.performingOrganization', 'min'=>0, 'max'=>1},
      'requestingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ChargeItem.requestingOrganization', 'min'=>0, 'max'=>1},
      'costCenter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ChargeItem.costCenter', 'min'=>0, 'max'=>1},
      'quantity' => {'type'=>'Quantity', 'path'=>'ChargeItem.quantity', 'min'=>0, 'max'=>1},
      'bodysite' => {'type'=>'CodeableConcept', 'path'=>'ChargeItem.bodysite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'factorOverride' => {'type'=>'decimal', 'path'=>'ChargeItem.factorOverride', 'min'=>0, 'max'=>1},
      'priceOverride' => {'type'=>'Money', 'path'=>'ChargeItem.priceOverride', 'min'=>0, 'max'=>1},
      'overrideReason' => {'type'=>'string', 'path'=>'ChargeItem.overrideReason', 'min'=>0, 'max'=>1},
      'enterer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'ChargeItem.enterer', 'min'=>0, 'max'=>1},
      'enteredDate' => {'type'=>'dateTime', 'path'=>'ChargeItem.enteredDate', 'min'=>0, 'max'=>1},
      'reason' => {'type'=>'CodeableConcept', 'path'=>'ChargeItem.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/icd-10', 'uri'=>nil}},
      'service' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/ImagingStudy', 'http://hl7.org/fhir/StructureDefinition/Immunization', 'http://hl7.org/fhir/StructureDefinition/MedicationAdministration', 'http://hl7.org/fhir/StructureDefinition/MedicationDispense', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/SupplyDelivery'], 'type'=>'Reference', 'path'=>'ChargeItem.service', 'min'=>0, 'max'=>Float::INFINITY},
      'productReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'ChargeItem.product[x]', 'min'=>0, 'max'=>1},
      'productCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ChargeItem.product[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-kind', 'uri'=>nil}},
      'account' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Account'], 'type'=>'Reference', 'path'=>'ChargeItem.account', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'ChargeItem.note', 'min'=>0, 'max'=>Float::INFINITY},
      'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ChargeItem.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Performer < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'function' => {'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/performer-role', 'uri'=>nil}},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :function          # 0-1 CodeableConcept
      attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|Device|RelatedPerson)
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :definitionUri          # 0-* [ uri ]
    attr_accessor :definitionCanonical    # 0-* [ canonical ]
    attr_accessor :status                 # 1-1 code
    attr_accessor :partOf                 # 0-* [ Reference(ChargeItem) ]
    attr_accessor :code                   # 1-1 CodeableConcept
    attr_accessor :subject                # 1-1 Reference(Patient|Group)
    attr_accessor :context                # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :occurrenceDateTime     # 0-1 dateTime
    attr_accessor :occurrencePeriod       # 0-1 Period
    attr_accessor :occurrenceTiming       # 0-1 Timing
    attr_accessor :performer              # 0-* [ ChargeItem::Performer ]
    attr_accessor :performingOrganization # 0-1 Reference(Organization)
    attr_accessor :requestingOrganization # 0-1 Reference(Organization)
    attr_accessor :costCenter             # 0-1 Reference(Organization)
    attr_accessor :quantity               # 0-1 Quantity
    attr_accessor :bodysite               # 0-* [ CodeableConcept ]
    attr_accessor :factorOverride         # 0-1 decimal
    attr_accessor :priceOverride          # 0-1 Money
    attr_accessor :overrideReason         # 0-1 string
    attr_accessor :enterer                # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|Device|RelatedPerson)
    attr_accessor :enteredDate            # 0-1 dateTime
    attr_accessor :reason                 # 0-* [ CodeableConcept ]
    attr_accessor :service                # 0-* [ Reference(DiagnosticReport|ImagingStudy|Immunization|MedicationAdministration|MedicationDispense|Observation|Procedure|SupplyDelivery) ]
    attr_accessor :productReference       # 0-1 Reference(Device|Medication|Substance)
    attr_accessor :productCodeableConcept # 0-1 CodeableConcept
    attr_accessor :account                # 0-* [ Reference(Account) ]
    attr_accessor :note                   # 0-* [ Annotation ]
    attr_accessor :supportingInformation  # 0-* [ Reference(Resource) ]

    def resourceType
      'ChargeItem'
    end
  end
end