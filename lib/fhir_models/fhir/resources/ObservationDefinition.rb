module FHIR
  class ObservationDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = 
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ObservationDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ObservationDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ObservationDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ObservationDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ObservationDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ObservationDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ObservationDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ObservationDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'category' => {'type'=>'CodeableConcept', 'path'=>'ObservationDefinition.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-category', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'ObservationDefinition.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-codes', 'uri'=>nil}},
      'identifier' => {'type'=>'Identifier', 'path'=>'ObservationDefinition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'permittedDataType' => {'type'=>'code', 'path'=>'ObservationDefinition.permittedDataType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/permitted-data-type|4.0.0', 'uri'=>nil}},
      'multipleResultsAllowed' => {'type'=>'boolean', 'path'=>'ObservationDefinition.multipleResultsAllowed', 'min'=>0, 'max'=>1},
      'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'ObservationDefinition.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-methods', 'uri'=>nil}},
      'preferredReportName' => {'type'=>'string', 'path'=>'ObservationDefinition.preferredReportName', 'min'=>0, 'max'=>1},
      'quantitativeDetails' => {'type'=>'ObservationDefinition::QuantitativeDetails', 'path'=>'ObservationDefinition.quantitativeDetails', 'min'=>0, 'max'=>1},
      'qualifiedInterval' => {'type'=>'ObservationDefinition::QualifiedInterval', 'path'=>'ObservationDefinition.qualifiedInterval', 'min'=>0, 'max'=>Float::INFINITY},
      'validCodedValueSet' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet'], 'type'=>'Reference', 'path'=>'ObservationDefinition.validCodedValueSet', 'min'=>0, 'max'=>1},
      'normalCodedValueSet' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet'], 'type'=>'Reference', 'path'=>'ObservationDefinition.normalCodedValueSet', 'min'=>0, 'max'=>1},
      'abnormalCodedValueSet' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet'], 'type'=>'Reference', 'path'=>'ObservationDefinition.abnormalCodedValueSet', 'min'=>0, 'max'=>1},
      'criticalCodedValueSet' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet'], 'type'=>'Reference', 'path'=>'ObservationDefinition.criticalCodedValueSet', 'min'=>0, 'max'=>1}
    }

    class QuantitativeDetails < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'QuantitativeDetails.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'QuantitativeDetails.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'QuantitativeDetails.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'customaryUnit' => {'type'=>'CodeableConcept', 'path'=>'QuantitativeDetails.customaryUnit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ucum-units', 'uri'=>nil}},
        'unit' => {'type'=>'CodeableConcept', 'path'=>'QuantitativeDetails.unit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ucum-units', 'uri'=>nil}},
        'conversionFactor' => {'type'=>'decimal', 'path'=>'QuantitativeDetails.conversionFactor', 'min'=>0, 'max'=>1},
        'decimalPrecision' => {'type'=>'integer', 'path'=>'QuantitativeDetails.decimalPrecision', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :customaryUnit     # 0-1 CodeableConcept
      attr_accessor :unit              # 0-1 CodeableConcept
      attr_accessor :conversionFactor  # 0-1 decimal
      attr_accessor :decimalPrecision  # 0-1 integer
    end

    class QualifiedInterval < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'QualifiedInterval.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'QualifiedInterval.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'QualifiedInterval.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'category' => {'type'=>'code', 'path'=>'QualifiedInterval.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-range-category|4.0.0', 'uri'=>nil}},
        'range' => {'type'=>'Range', 'path'=>'QualifiedInterval.range', 'min'=>0, 'max'=>1},
        'context' => {'type'=>'CodeableConcept', 'path'=>'QualifiedInterval.context', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/referencerange-meaning', 'uri'=>nil}},
        'appliesTo' => {'type'=>'CodeableConcept', 'path'=>'QualifiedInterval.appliesTo', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/referencerange-appliesto', 'uri'=>nil}},
        'gender' => {'type'=>'code', 'path'=>'QualifiedInterval.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/administrative-gender|4.0.0', 'uri'=>nil}},
        'age' => {'type'=>'Range', 'path'=>'QualifiedInterval.age', 'min'=>0, 'max'=>1},
        'gestationalAge' => {'type'=>'Range', 'path'=>'QualifiedInterval.gestationalAge', 'min'=>0, 'max'=>1},
        'condition' => {'type'=>'string', 'path'=>'QualifiedInterval.condition', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :category          # 0-1 code
      attr_accessor :range             # 0-1 Range
      attr_accessor :context           # 0-1 CodeableConcept
      attr_accessor :appliesTo         # 0-* [ CodeableConcept ]
      attr_accessor :gender            # 0-1 code
      attr_accessor :age               # 0-1 Range
      attr_accessor :gestationalAge    # 0-1 Range
      attr_accessor :condition         # 0-1 string
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :category               # 0-* [ CodeableConcept ]
    attr_accessor :code                   # 1-1 CodeableConcept
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :permittedDataType      # 0-* [ code ]
    attr_accessor :multipleResultsAllowed # 0-1 boolean
    attr_accessor :local_method           # 0-1 CodeableConcept
    attr_accessor :preferredReportName    # 0-1 string
    attr_accessor :quantitativeDetails    # 0-1 ObservationDefinition::QuantitativeDetails
    attr_accessor :qualifiedInterval      # 0-* [ ObservationDefinition::QualifiedInterval ]
    attr_accessor :validCodedValueSet     # 0-1 Reference(ValueSet)
    attr_accessor :normalCodedValueSet    # 0-1 Reference(ValueSet)
    attr_accessor :abnormalCodedValueSet  # 0-1 Reference(ValueSet)
    attr_accessor :criticalCodedValueSet  # 0-1 Reference(ValueSet)

    def resourceType
      'ObservationDefinition'
    end
  end
end