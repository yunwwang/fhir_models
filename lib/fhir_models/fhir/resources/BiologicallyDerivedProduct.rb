module FHIR
  class BiologicallyDerivedProduct < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = 
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'BiologicallyDerivedProduct.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'BiologicallyDerivedProduct.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'BiologicallyDerivedProduct.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'BiologicallyDerivedProduct.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'BiologicallyDerivedProduct.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'BiologicallyDerivedProduct.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'BiologicallyDerivedProduct.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'BiologicallyDerivedProduct.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'BiologicallyDerivedProduct.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'productCategory' => {'type'=>'code', 'path'=>'BiologicallyDerivedProduct.productCategory', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/product-category|4.0.0', 'uri'=>nil}},
      'productCode' => {'type'=>'CodeableConcept', 'path'=>'BiologicallyDerivedProduct.productCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'status' => {'type'=>'code', 'path'=>'BiologicallyDerivedProduct.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/product-status|4.0.0', 'uri'=>nil}},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProduct.request', 'min'=>0, 'max'=>Float::INFINITY},
      'quantity' => {'type'=>'integer', 'path'=>'BiologicallyDerivedProduct.quantity', 'min'=>0, 'max'=>1},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProduct.parent', 'min'=>0, 'max'=>Float::INFINITY},
      'collection' => {'type'=>'BiologicallyDerivedProduct::Collection', 'path'=>'BiologicallyDerivedProduct.collection', 'min'=>0, 'max'=>1},
      'processing' => {'type'=>'BiologicallyDerivedProduct::Processing', 'path'=>'BiologicallyDerivedProduct.processing', 'min'=>0, 'max'=>Float::INFINITY},
      'manipulation' => {'type'=>'BiologicallyDerivedProduct::Manipulation', 'path'=>'BiologicallyDerivedProduct.manipulation', 'min'=>0, 'max'=>1},
      'storage' => {'type'=>'BiologicallyDerivedProduct::Storage', 'path'=>'BiologicallyDerivedProduct.storage', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Collection < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'collected' => ['dateTime', 'Period']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Collection.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Collection.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Collection.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'collector' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Collection.collector', 'min'=>0, 'max'=>1},
        'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Collection.source', 'min'=>0, 'max'=>1},
        'collectedDateTime' => {'type'=>'dateTime', 'path'=>'Collection.collected[x]', 'min'=>0, 'max'=>1},
        'collectedPeriod' => {'type'=>'Period', 'path'=>'Collection.collected[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :collector         # 0-1 Reference(Practitioner|PractitionerRole)
      attr_accessor :source            # 0-1 Reference(Patient|Organization)
      attr_accessor :collectedDateTime # 0-1 dateTime
      attr_accessor :collectedPeriod   # 0-1 Period
    end

    class Processing < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'time' => ['dateTime', 'Period']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Processing.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Processing.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Processing.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Processing.description', 'min'=>0, 'max'=>1},
        'procedure' => {'type'=>'CodeableConcept', 'path'=>'Processing.procedure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-code', 'uri'=>nil}},
        'additive' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Processing.additive', 'min'=>0, 'max'=>1},
        'timeDateTime' => {'type'=>'dateTime', 'path'=>'Processing.time[x]', 'min'=>0, 'max'=>1},
        'timePeriod' => {'type'=>'Period', 'path'=>'Processing.time[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :description       # 0-1 string
      attr_accessor :procedure         # 0-1 CodeableConcept
      attr_accessor :additive          # 0-1 Reference(Substance)
      attr_accessor :timeDateTime      # 0-1 dateTime
      attr_accessor :timePeriod        # 0-1 Period
    end

    class Manipulation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'time' => ['dateTime', 'Period']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Manipulation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Manipulation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Manipulation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Manipulation.description', 'min'=>0, 'max'=>1},
        'timeDateTime' => {'type'=>'dateTime', 'path'=>'Manipulation.time[x]', 'min'=>0, 'max'=>1},
        'timePeriod' => {'type'=>'Period', 'path'=>'Manipulation.time[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :description       # 0-1 string
      attr_accessor :timeDateTime      # 0-1 dateTime
      attr_accessor :timePeriod        # 0-1 Period
    end

    class Storage < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Storage.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Storage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Storage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Storage.description', 'min'=>0, 'max'=>1},
        'temperature' => {'type'=>'decimal', 'path'=>'Storage.temperature', 'min'=>0, 'max'=>1},
        'scale' => {'type'=>'code', 'path'=>'Storage.scale', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/product-storage-scale|4.0.0', 'uri'=>nil}},
        'duration' => {'type'=>'Period', 'path'=>'Storage.duration', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :description       # 0-1 string
      attr_accessor :temperature       # 0-1 decimal
      attr_accessor :scale             # 0-1 code
      attr_accessor :duration          # 0-1 Period
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
    attr_accessor :productCategory   # 0-1 code
    attr_accessor :productCode       # 0-1 CodeableConcept
    attr_accessor :status            # 0-1 code
    attr_accessor :request           # 0-* [ Reference(ServiceRequest) ]
    attr_accessor :quantity          # 0-1 integer
    attr_accessor :parent            # 0-* [ Reference(BiologicallyDerivedProduct) ]
    attr_accessor :collection        # 0-1 BiologicallyDerivedProduct::Collection
    attr_accessor :processing        # 0-* [ BiologicallyDerivedProduct::Processing ]
    attr_accessor :manipulation      # 0-1 BiologicallyDerivedProduct::Manipulation
    attr_accessor :storage           # 0-* [ BiologicallyDerivedProduct::Storage ]

    def resourceType
      'BiologicallyDerivedProduct'
    end
  end
end