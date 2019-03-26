module FHIR
  class NutritionOrder < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['identifier', 'patient', 'encounter', 'additive', 'datetime', 'formula', 'instantiates-canonical', 'instantiates-uri', 'oraldiet', 'provider', 'status', 'supplement']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'NutritionOrder.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'NutritionOrder.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'NutritionOrder.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'NutritionOrder.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'NutritionOrder.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'NutritionOrder.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'NutritionOrder.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'NutritionOrder.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'NutritionOrder.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'NutritionOrder.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesUri' => {'type'=>'uri', 'path'=>'NutritionOrder.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiates' => {'type'=>'uri', 'path'=>'NutritionOrder.instantiates', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'NutritionOrder.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-status|4.0.0', 'uri'=>nil}},
      'intent' => {'type'=>'code', 'path'=>'NutritionOrder.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-intent|4.0.0', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'NutritionOrder.patient', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'NutritionOrder.encounter', 'min'=>0, 'max'=>1},
      'dateTime' => {'type'=>'dateTime', 'path'=>'NutritionOrder.dateTime', 'min'=>1, 'max'=>1},
      'orderer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'NutritionOrder.orderer', 'min'=>0, 'max'=>1},
      'allergyIntolerance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/AllergyIntolerance'], 'type'=>'Reference', 'path'=>'NutritionOrder.allergyIntolerance', 'min'=>0, 'max'=>Float::INFINITY},
      'foodPreferenceModifier' => {'type'=>'CodeableConcept', 'path'=>'NutritionOrder.foodPreferenceModifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-diet', 'uri'=>nil}},
      'excludeFoodModifier' => {'type'=>'CodeableConcept', 'path'=>'NutritionOrder.excludeFoodModifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/food-type', 'uri'=>nil}},
      'oralDiet' => {'type'=>'NutritionOrder::OralDiet', 'path'=>'NutritionOrder.oralDiet', 'min'=>0, 'max'=>1},
      'supplement' => {'type'=>'NutritionOrder::Supplement', 'path'=>'NutritionOrder.supplement', 'min'=>0, 'max'=>Float::INFINITY},
      'enteralFormula' => {'type'=>'NutritionOrder::EnteralFormula', 'path'=>'NutritionOrder.enteralFormula', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'NutritionOrder.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class OralDiet < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'OralDiet.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'OralDiet.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'OralDiet.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'OralDiet.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/diet-type', 'uri'=>nil}},
        'schedule' => {'type'=>'Timing', 'path'=>'OralDiet.schedule', 'min'=>0, 'max'=>Float::INFINITY},
        'nutrient' => {'type'=>'NutritionOrder::OralDiet::Nutrient', 'path'=>'OralDiet.nutrient', 'min'=>0, 'max'=>Float::INFINITY},
        'texture' => {'type'=>'NutritionOrder::OralDiet::Texture', 'path'=>'OralDiet.texture', 'min'=>0, 'max'=>Float::INFINITY},
        'fluidConsistencyType' => {'type'=>'CodeableConcept', 'path'=>'OralDiet.fluidConsistencyType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consistency-type', 'uri'=>nil}},
        'instruction' => {'type'=>'string', 'path'=>'OralDiet.instruction', 'min'=>0, 'max'=>1}
      }

      class Nutrient < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Nutrient.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Nutrient.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Nutrient.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifier' => {'type'=>'CodeableConcept', 'path'=>'Nutrient.modifier', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/nutrient-code', 'uri'=>nil}},
          'amount' => {'type'=>'Quantity', 'path'=>'Nutrient.amount', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :modifier          # 0-1 CodeableConcept
        attr_accessor :amount            # 0-1 Quantity
      end

      class Texture < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Texture.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Texture.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Texture.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifier' => {'type'=>'CodeableConcept', 'path'=>'Texture.modifier', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/texture-code', 'uri'=>nil}},
          'foodType' => {'type'=>'CodeableConcept', 'path'=>'Texture.foodType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/modified-foodtype', 'uri'=>nil}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :modifier          # 0-1 CodeableConcept
        attr_accessor :foodType          # 0-1 CodeableConcept
      end

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :type                 # 0-* [ CodeableConcept ]
      attr_accessor :schedule             # 0-* [ Timing ]
      attr_accessor :nutrient             # 0-* [ NutritionOrder::OralDiet::Nutrient ]
      attr_accessor :texture              # 0-* [ NutritionOrder::OralDiet::Texture ]
      attr_accessor :fluidConsistencyType # 0-* [ CodeableConcept ]
      attr_accessor :instruction          # 0-1 string
    end

    class Supplement < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Supplement.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Supplement.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Supplement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Supplement.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/supplement-type', 'uri'=>nil}},
        'productName' => {'type'=>'string', 'path'=>'Supplement.productName', 'min'=>0, 'max'=>1},
        'schedule' => {'type'=>'Timing', 'path'=>'Supplement.schedule', 'min'=>0, 'max'=>Float::INFINITY},
        'quantity' => {'type'=>'Quantity', 'path'=>'Supplement.quantity', 'min'=>0, 'max'=>1},
        'instruction' => {'type'=>'string', 'path'=>'Supplement.instruction', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :productName       # 0-1 string
      attr_accessor :schedule          # 0-* [ Timing ]
      attr_accessor :quantity          # 0-1 Quantity
      attr_accessor :instruction       # 0-1 string
    end

    class EnteralFormula < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'EnteralFormula.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'EnteralFormula.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'EnteralFormula.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'baseFormulaType' => {'type'=>'CodeableConcept', 'path'=>'EnteralFormula.baseFormulaType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/entformula-type', 'uri'=>nil}},
        'baseFormulaProductName' => {'type'=>'string', 'path'=>'EnteralFormula.baseFormulaProductName', 'min'=>0, 'max'=>1},
        'additiveType' => {'type'=>'CodeableConcept', 'path'=>'EnteralFormula.additiveType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/entformula-additive', 'uri'=>nil}},
        'additiveProductName' => {'type'=>'string', 'path'=>'EnteralFormula.additiveProductName', 'min'=>0, 'max'=>1},
        'caloricDensity' => {'type'=>'Quantity', 'path'=>'EnteralFormula.caloricDensity', 'min'=>0, 'max'=>1},
        'routeofAdministration' => {'type'=>'CodeableConcept', 'path'=>'EnteralFormula.routeofAdministration', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/enteral-route', 'uri'=>nil}},
        'administration' => {'type'=>'NutritionOrder::EnteralFormula::Administration', 'path'=>'EnteralFormula.administration', 'min'=>0, 'max'=>Float::INFINITY},
        'maxVolumeToDeliver' => {'type'=>'Quantity', 'path'=>'EnteralFormula.maxVolumeToDeliver', 'min'=>0, 'max'=>1},
        'administrationInstruction' => {'type'=>'string', 'path'=>'EnteralFormula.administrationInstruction', 'min'=>0, 'max'=>1}
      }

      class Administration < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'rate' => ['Quantity', 'Ratio']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Administration.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Administration.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Administration.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'schedule' => {'type'=>'Timing', 'path'=>'Administration.schedule', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'Administration.quantity', 'min'=>0, 'max'=>1},
          'rateQuantity' => {'type'=>'Quantity', 'path'=>'Administration.rate[x]', 'min'=>0, 'max'=>1},
          'rateRatio' => {'type'=>'Ratio', 'path'=>'Administration.rate[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :schedule          # 0-1 Timing
        attr_accessor :quantity          # 0-1 Quantity
        attr_accessor :rateQuantity      # 0-1 Quantity
        attr_accessor :rateRatio         # 0-1 Ratio
      end

      attr_accessor :id                        # 0-1 string
      attr_accessor :extension                 # 0-* [ Extension ]
      attr_accessor :modifierExtension         # 0-* [ Extension ]
      attr_accessor :baseFormulaType           # 0-1 CodeableConcept
      attr_accessor :baseFormulaProductName    # 0-1 string
      attr_accessor :additiveType              # 0-1 CodeableConcept
      attr_accessor :additiveProductName       # 0-1 string
      attr_accessor :caloricDensity            # 0-1 Quantity
      attr_accessor :routeofAdministration     # 0-1 CodeableConcept
      attr_accessor :administration            # 0-* [ NutritionOrder::EnteralFormula::Administration ]
      attr_accessor :maxVolumeToDeliver        # 0-1 Quantity
      attr_accessor :administrationInstruction # 0-1 string
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
    attr_accessor :instantiatesCanonical  # 0-* [ canonical ]
    attr_accessor :instantiatesUri        # 0-* [ uri ]
    attr_accessor :instantiates           # 0-* [ uri ]
    attr_accessor :status                 # 1-1 code
    attr_accessor :intent                 # 1-1 code
    attr_accessor :patient                # 1-1 Reference(Patient)
    attr_accessor :encounter              # 0-1 Reference(Encounter)
    attr_accessor :dateTime               # 1-1 dateTime
    attr_accessor :orderer                # 0-1 Reference(Practitioner|PractitionerRole)
    attr_accessor :allergyIntolerance     # 0-* [ Reference(AllergyIntolerance) ]
    attr_accessor :foodPreferenceModifier # 0-* [ CodeableConcept ]
    attr_accessor :excludeFoodModifier    # 0-* [ CodeableConcept ]
    attr_accessor :oralDiet               # 0-1 NutritionOrder::OralDiet
    attr_accessor :supplement             # 0-* [ NutritionOrder::Supplement ]
    attr_accessor :enteralFormula         # 0-1 NutritionOrder::EnteralFormula
    attr_accessor :note                   # 0-* [ Annotation ]

    def resourceType
      'NutritionOrder'
    end
  end
end