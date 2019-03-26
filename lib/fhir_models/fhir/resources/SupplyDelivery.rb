module FHIR
  class SupplyDelivery < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'occurrence' => ['dateTime', 'Period', 'Timing']
    }
    SEARCH_PARAMS = ['identifier', 'patient', 'receiver', 'status', 'supplier']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'SupplyDelivery.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'SupplyDelivery.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'SupplyDelivery.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'SupplyDelivery.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'SupplyDelivery.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'SupplyDelivery.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'SupplyDelivery.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'SupplyDelivery.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'SupplyDelivery.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/SupplyRequest'], 'type'=>'Reference', 'path'=>'SupplyDelivery.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/SupplyDelivery', 'http://hl7.org/fhir/StructureDefinition/Contract'], 'type'=>'Reference', 'path'=>'SupplyDelivery.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'SupplyDelivery.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/supplydelivery-status|4.0.0', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'SupplyDelivery.patient', 'min'=>0, 'max'=>1},
      'type' => {'type'=>'CodeableConcept', 'path'=>'SupplyDelivery.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/supplydelivery-type|4.0.0', 'uri'=>nil}},
      'suppliedItem' => {'type'=>'SupplyDelivery::SuppliedItem', 'path'=>'SupplyDelivery.suppliedItem', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'SupplyDelivery.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrencePeriod' => {'type'=>'Period', 'path'=>'SupplyDelivery.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrenceTiming' => {'type'=>'Timing', 'path'=>'SupplyDelivery.occurrence[x]', 'min'=>0, 'max'=>1},
      'supplier' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'SupplyDelivery.supplier', 'min'=>0, 'max'=>1},
      'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'SupplyDelivery.destination', 'min'=>0, 'max'=>1},
      'receiver' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'SupplyDelivery.receiver', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class SuppliedItem < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'item' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'SuppliedItem.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'SuppliedItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SuppliedItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'quantity' => {'type'=>'Quantity', 'path'=>'SuppliedItem.quantity', 'min'=>0, 'max'=>1},
        'itemCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'SuppliedItem.item[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/supply-item', 'uri'=>nil}},
        'itemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SuppliedItem.item[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :quantity            # 0-1 Quantity
      attr_accessor :itemCodeableConcept # 0-1 CodeableConcept
      attr_accessor :itemReference       # 0-1 Reference(Medication|Substance|Device)
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
    attr_accessor :basedOn            # 0-* [ Reference(SupplyRequest) ]
    attr_accessor :partOf             # 0-* [ Reference(SupplyDelivery|Contract) ]
    attr_accessor :status             # 0-1 code
    attr_accessor :patient            # 0-1 Reference(Patient)
    attr_accessor :type               # 0-1 CodeableConcept
    attr_accessor :suppliedItem       # 0-1 SupplyDelivery::SuppliedItem
    attr_accessor :occurrenceDateTime # 0-1 dateTime
    attr_accessor :occurrencePeriod   # 0-1 Period
    attr_accessor :occurrenceTiming   # 0-1 Timing
    attr_accessor :supplier           # 0-1 Reference(Practitioner|PractitionerRole|Organization)
    attr_accessor :destination        # 0-1 Reference(Location)
    attr_accessor :receiver           # 0-* [ Reference(Practitioner|PractitionerRole) ]

    def resourceType
      'SupplyDelivery'
    end
  end
end