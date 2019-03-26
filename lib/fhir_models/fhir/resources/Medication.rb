module FHIR
  class Medication < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['code', 'expiration-date', 'form', 'identifier', 'ingredient', 'ingredient-code', 'lot-number', 'manufacturer', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Medication.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Medication.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Medication.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Medication.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Medication.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Medication.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Medication.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Medication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Medication.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'code' => {'type'=>'CodeableConcept', 'path'=>'Medication.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-codes', 'uri'=>nil}},
      'status' => {'type'=>'code', 'path'=>'Medication.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-status|4.0.0', 'uri'=>nil}},
      'manufacturer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Medication.manufacturer', 'min'=>0, 'max'=>1},
      'form' => {'type'=>'CodeableConcept', 'path'=>'Medication.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-form-codes', 'uri'=>nil}},
      'amount' => {'type'=>'Ratio', 'path'=>'Medication.amount', 'min'=>0, 'max'=>1},
      'ingredient' => {'type'=>'Medication::Ingredient', 'path'=>'Medication.ingredient', 'min'=>0, 'max'=>Float::INFINITY},
      'batch' => {'type'=>'Medication::Batch', 'path'=>'Medication.batch', 'min'=>0, 'max'=>1}
    }

    class Ingredient < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'item' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Ingredient.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Ingredient.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Ingredient.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'itemCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Ingredient.item[x]', 'min'=>1, 'max'=>1},
        'itemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'Ingredient.item[x]', 'min'=>1, 'max'=>1},
        'isActive' => {'type'=>'boolean', 'path'=>'Ingredient.isActive', 'min'=>0, 'max'=>1},
        'strength' => {'type'=>'Ratio', 'path'=>'Ingredient.strength', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :itemCodeableConcept # 1-1 CodeableConcept
      attr_accessor :itemReference       # 1-1 Reference(Substance|Medication)
      attr_accessor :isActive            # 0-1 boolean
      attr_accessor :strength            # 0-1 Ratio
    end

    class Batch < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Batch.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Batch.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Batch.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'lotNumber' => {'type'=>'string', 'path'=>'Batch.lotNumber', 'min'=>0, 'max'=>1},
        'expirationDate' => {'type'=>'dateTime', 'path'=>'Batch.expirationDate', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :lotNumber         # 0-1 string
      attr_accessor :expirationDate    # 0-1 dateTime
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :code              # 0-1 CodeableConcept
    attr_accessor :status            # 0-1 code
    attr_accessor :manufacturer      # 0-1 Reference(Organization)
    attr_accessor :form              # 0-1 CodeableConcept
    attr_accessor :amount            # 0-1 Ratio
    attr_accessor :ingredient        # 0-* [ Medication::Ingredient ]
    attr_accessor :batch             # 0-1 Medication::Batch

    def resourceType
      'Medication'
    end
  end
end