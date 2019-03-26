module FHIR
  class Substance < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['category', 'code', 'container-identifier', 'expiry', 'identifier', 'quantity', 'status', 'substance-reference']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Substance.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Substance.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Substance.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Substance.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Substance.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Substance.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Substance.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Substance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Substance.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Substance.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/substance-status|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'Substance.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/substance-category', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'Substance.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/substance-code', 'uri'=>nil}},
      'description' => {'type'=>'string', 'path'=>'Substance.description', 'min'=>0, 'max'=>1},
      'instance' => {'type'=>'Substance::Instance', 'path'=>'Substance.instance', 'min'=>0, 'max'=>Float::INFINITY},
      'ingredient' => {'type'=>'Substance::Ingredient', 'path'=>'Substance.ingredient', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Instance < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Instance.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Instance.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Instance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Instance.identifier', 'min'=>0, 'max'=>1},
        'expiry' => {'type'=>'dateTime', 'path'=>'Instance.expiry', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'Instance.quantity', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-1 Identifier
      attr_accessor :expiry            # 0-1 dateTime
      attr_accessor :quantity          # 0-1 Quantity
    end

    class Ingredient < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'substance' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Ingredient.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Ingredient.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Ingredient.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'quantity' => {'type'=>'Ratio', 'path'=>'Ingredient.quantity', 'min'=>0, 'max'=>1},
        'substanceCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Ingredient.substance[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/substance-code', 'uri'=>nil}},
        'substanceReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Ingredient.substance[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                       # 0-1 string
      attr_accessor :extension                # 0-* [ Extension ]
      attr_accessor :modifierExtension        # 0-* [ Extension ]
      attr_accessor :quantity                 # 0-1 Ratio
      attr_accessor :substanceCodeableConcept # 1-1 CodeableConcept
      attr_accessor :substanceReference       # 1-1 Reference(Substance)
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
    attr_accessor :status            # 0-1 code
    attr_accessor :category          # 0-* [ CodeableConcept ]
    attr_accessor :code              # 1-1 CodeableConcept
    attr_accessor :description       # 0-1 string
    attr_accessor :instance          # 0-* [ Substance::Instance ]
    attr_accessor :ingredient        # 0-* [ Substance::Ingredient ]

    def resourceType
      'Substance'
    end
  end
end