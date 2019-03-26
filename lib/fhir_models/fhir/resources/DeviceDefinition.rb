module FHIR
  class DeviceDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'manufacturer' => ['string', 'Reference']
    }
    SEARCH_PARAMS = ['identifier', 'parent', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DeviceDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DeviceDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DeviceDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DeviceDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'DeviceDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DeviceDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DeviceDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'DeviceDefinition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'udiDeviceIdentifier' => {'type'=>'DeviceDefinition::UdiDeviceIdentifier', 'path'=>'DeviceDefinition.udiDeviceIdentifier', 'min'=>0, 'max'=>Float::INFINITY},
      'manufacturerString' => {'type'=>'string', 'path'=>'DeviceDefinition.manufacturer[x]', 'min'=>0, 'max'=>1},
      'manufacturerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DeviceDefinition.manufacturer[x]', 'min'=>0, 'max'=>1},
      'deviceName' => {'type'=>'DeviceDefinition::DeviceName', 'path'=>'DeviceDefinition.deviceName', 'min'=>0, 'max'=>Float::INFINITY},
      'modelNumber' => {'type'=>'string', 'path'=>'DeviceDefinition.modelNumber', 'min'=>0, 'max'=>1},
      'type' => {'type'=>'CodeableConcept', 'path'=>'DeviceDefinition.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-kind', 'uri'=>nil}},
      'specialization' => {'type'=>'DeviceDefinition::Specialization', 'path'=>'DeviceDefinition.specialization', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'DeviceDefinition.version', 'min'=>0, 'max'=>Float::INFINITY},
      'safety' => {'type'=>'CodeableConcept', 'path'=>'DeviceDefinition.safety', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-safety', 'uri'=>nil}},
      'shelfLifeStorage' => {'type'=>'ProductShelfLife', 'path'=>'DeviceDefinition.shelfLifeStorage', 'min'=>0, 'max'=>Float::INFINITY},
      'physicalCharacteristics' => {'type'=>'ProdCharacteristic', 'path'=>'DeviceDefinition.physicalCharacteristics', 'min'=>0, 'max'=>1},
      'languageCode' => {'type'=>'CodeableConcept', 'path'=>'DeviceDefinition.languageCode', 'min'=>0, 'max'=>Float::INFINITY},
      'capability' => {'type'=>'DeviceDefinition::Capability', 'path'=>'DeviceDefinition.capability', 'min'=>0, 'max'=>Float::INFINITY},
      'property' => {'type'=>'DeviceDefinition::Property', 'path'=>'DeviceDefinition.property', 'min'=>0, 'max'=>Float::INFINITY},
      'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DeviceDefinition.owner', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactPoint', 'path'=>'DeviceDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'DeviceDefinition.url', 'min'=>0, 'max'=>1},
      'onlineInformation' => {'type'=>'uri', 'path'=>'DeviceDefinition.onlineInformation', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'DeviceDefinition.note', 'min'=>0, 'max'=>Float::INFINITY},
      'quantity' => {'type'=>'Quantity', 'path'=>'DeviceDefinition.quantity', 'min'=>0, 'max'=>1},
      'parentDevice' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DeviceDefinition'], 'type'=>'Reference', 'path'=>'DeviceDefinition.parentDevice', 'min'=>0, 'max'=>1},
      'material' => {'type'=>'DeviceDefinition::Material', 'path'=>'DeviceDefinition.material', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class UdiDeviceIdentifier < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'UdiDeviceIdentifier.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'UdiDeviceIdentifier.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'UdiDeviceIdentifier.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'deviceIdentifier' => {'type'=>'string', 'path'=>'UdiDeviceIdentifier.deviceIdentifier', 'min'=>1, 'max'=>1},
        'issuer' => {'type'=>'uri', 'path'=>'UdiDeviceIdentifier.issuer', 'min'=>1, 'max'=>1},
        'jurisdiction' => {'type'=>'uri', 'path'=>'UdiDeviceIdentifier.jurisdiction', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :deviceIdentifier  # 1-1 string
      attr_accessor :issuer            # 1-1 uri
      attr_accessor :jurisdiction      # 1-1 uri
    end

    class DeviceName < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DeviceName.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DeviceName.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceName.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'DeviceName.name', 'min'=>1, 'max'=>1},
        'type' => {'type'=>'code', 'path'=>'DeviceName.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-nametype|4.0.0', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 string
      attr_accessor :type              # 1-1 code
    end

    class Specialization < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Specialization.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Specialization.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Specialization.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'systemType' => {'type'=>'string', 'path'=>'Specialization.systemType', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Specialization.version', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :systemType        # 1-1 string
      attr_accessor :version           # 0-1 string
    end

    class Capability < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Capability.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Capability.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Capability.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Capability.type', 'min'=>1, 'max'=>1},
        'description' => {'type'=>'CodeableConcept', 'path'=>'Capability.description', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :description       # 0-* [ CodeableConcept ]
    end

    class Property < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Property.type', 'min'=>1, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Property.valueQuantity', 'min'=>0, 'max'=>Float::INFINITY},
        'valueCode' => {'type'=>'CodeableConcept', 'path'=>'Property.valueCode', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :valueQuantity     # 0-* [ Quantity ]
      attr_accessor :valueCode         # 0-* [ CodeableConcept ]
    end

    class Material < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Material.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Material.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Material.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'substance' => {'type'=>'CodeableConcept', 'path'=>'Material.substance', 'min'=>1, 'max'=>1},
        'alternate' => {'type'=>'boolean', 'path'=>'Material.alternate', 'min'=>0, 'max'=>1},
        'allergenicIndicator' => {'type'=>'boolean', 'path'=>'Material.allergenicIndicator', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :substance           # 1-1 CodeableConcept
      attr_accessor :alternate           # 0-1 boolean
      attr_accessor :allergenicIndicator # 0-1 boolean
    end

    attr_accessor :id                      # 0-1 id
    attr_accessor :meta                    # 0-1 Meta
    attr_accessor :implicitRules           # 0-1 uri
    attr_accessor :language                # 0-1 code
    attr_accessor :text                    # 0-1 Narrative
    attr_accessor :contained               # 0-* [ Resource ]
    attr_accessor :extension               # 0-* [ Extension ]
    attr_accessor :modifierExtension       # 0-* [ Extension ]
    attr_accessor :identifier              # 0-* [ Identifier ]
    attr_accessor :udiDeviceIdentifier     # 0-* [ DeviceDefinition::UdiDeviceIdentifier ]
    attr_accessor :manufacturerString      # 0-1 string
    attr_accessor :manufacturerReference   # 0-1 Reference(Organization)
    attr_accessor :deviceName              # 0-* [ DeviceDefinition::DeviceName ]
    attr_accessor :modelNumber             # 0-1 string
    attr_accessor :type                    # 0-1 CodeableConcept
    attr_accessor :specialization          # 0-* [ DeviceDefinition::Specialization ]
    attr_accessor :version                 # 0-* [ string ]
    attr_accessor :safety                  # 0-* [ CodeableConcept ]
    attr_accessor :shelfLifeStorage        # 0-* [ ProductShelfLife ]
    attr_accessor :physicalCharacteristics # 0-1 ProdCharacteristic
    attr_accessor :languageCode            # 0-* [ CodeableConcept ]
    attr_accessor :capability              # 0-* [ DeviceDefinition::Capability ]
    attr_accessor :property                # 0-* [ DeviceDefinition::Property ]
    attr_accessor :owner                   # 0-1 Reference(Organization)
    attr_accessor :contact                 # 0-* [ ContactPoint ]
    attr_accessor :url                     # 0-1 uri
    attr_accessor :onlineInformation       # 0-1 uri
    attr_accessor :note                    # 0-* [ Annotation ]
    attr_accessor :quantity                # 0-1 Quantity
    attr_accessor :parentDevice            # 0-1 Reference(DeviceDefinition)
    attr_accessor :material                # 0-* [ DeviceDefinition::Material ]

    def resourceType
      'DeviceDefinition'
    end
  end
end