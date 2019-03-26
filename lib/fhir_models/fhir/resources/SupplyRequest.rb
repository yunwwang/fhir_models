module FHIR
  class SupplyRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'item' => ['CodeableConcept', 'Reference'],
      'occurrence' => ['dateTime', 'Period', 'Timing']
    }
    SEARCH_PARAMS = ['date', 'identifier', 'category', 'requester', 'status', 'subject', 'supplier']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'SupplyRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'SupplyRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'SupplyRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'SupplyRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'SupplyRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'SupplyRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'SupplyRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'SupplyRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'SupplyRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'SupplyRequest.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/supplyrequest-status|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'SupplyRequest.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/supplyrequest-kind', 'uri'=>nil}},
      'priority' => {'type'=>'code', 'path'=>'SupplyRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-priority|4.0.0', 'uri'=>nil}},
      'itemCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'SupplyRequest.item[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/supply-item', 'uri'=>nil}},
      'itemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SupplyRequest.item[x]', 'min'=>1, 'max'=>1},
      'quantity' => {'type'=>'Quantity', 'path'=>'SupplyRequest.quantity', 'min'=>1, 'max'=>1},
      'parameter' => {'type'=>'SupplyRequest::Parameter', 'path'=>'SupplyRequest.parameter', 'min'=>0, 'max'=>Float::INFINITY},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'SupplyRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrencePeriod' => {'type'=>'Period', 'path'=>'SupplyRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrenceTiming' => {'type'=>'Timing', 'path'=>'SupplyRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'authoredOn' => {'type'=>'dateTime', 'path'=>'SupplyRequest.authoredOn', 'min'=>0, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SupplyRequest.requester', 'min'=>0, 'max'=>1},
      'supplier' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'SupplyRequest.supplier', 'min'=>0, 'max'=>Float::INFINITY},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'SupplyRequest.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/supplyrequest-reason', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'SupplyRequest.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'deliverFrom' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'SupplyRequest.deliverFrom', 'min'=>0, 'max'=>1},
      'deliverTo' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'SupplyRequest.deliverTo', 'min'=>0, 'max'=>1}
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

    attr_accessor :id                  # 0-1 id
    attr_accessor :meta                # 0-1 Meta
    attr_accessor :implicitRules       # 0-1 uri
    attr_accessor :language            # 0-1 code
    attr_accessor :text                # 0-1 Narrative
    attr_accessor :contained           # 0-* [ Resource ]
    attr_accessor :extension           # 0-* [ Extension ]
    attr_accessor :modifierExtension   # 0-* [ Extension ]
    attr_accessor :identifier          # 0-* [ Identifier ]
    attr_accessor :status              # 0-1 code
    attr_accessor :category            # 0-1 CodeableConcept
    attr_accessor :priority            # 0-1 code
    attr_accessor :itemCodeableConcept # 1-1 CodeableConcept
    attr_accessor :itemReference       # 1-1 Reference(Medication|Substance|Device)
    attr_accessor :quantity            # 1-1 Quantity
    attr_accessor :parameter           # 0-* [ SupplyRequest::Parameter ]
    attr_accessor :occurrenceDateTime  # 0-1 dateTime
    attr_accessor :occurrencePeriod    # 0-1 Period
    attr_accessor :occurrenceTiming    # 0-1 Timing
    attr_accessor :authoredOn          # 0-1 dateTime
    attr_accessor :requester           # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson|Device)
    attr_accessor :supplier            # 0-* [ Reference(Organization|HealthcareService) ]
    attr_accessor :reasonCode          # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference     # 0-* [ Reference(Condition|Observation|DiagnosticReport|DocumentReference) ]
    attr_accessor :deliverFrom         # 0-1 Reference(Organization|Location)
    attr_accessor :deliverTo           # 0-1 Reference(Organization|Location|Patient)

    def resourceType
      'SupplyRequest'
    end
  end
end