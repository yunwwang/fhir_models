module FHIR
  class Device < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['device-name', 'identifier', 'location', 'manufacturer', 'model', 'organization', 'patient', 'status', 'type', 'udi-carrier', 'udi-di', 'url']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Device.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Device.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Device.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Device.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Device.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Device.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Device.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Device.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Device.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'definition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DeviceDefinition'], 'type'=>'Reference', 'path'=>'Device.definition', 'min'=>0, 'max'=>1},
      'udiCarrier' => {'type'=>'Device::UdiCarrier', 'path'=>'Device.udiCarrier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Device.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-status|4.0.0', 'uri'=>nil}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'Device.statusReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-status-reason', 'uri'=>nil}},
      'distinctIdentifier' => {'type'=>'string', 'path'=>'Device.distinctIdentifier', 'min'=>0, 'max'=>1},
      'manufacturer' => {'type'=>'string', 'path'=>'Device.manufacturer', 'min'=>0, 'max'=>1},
      'manufactureDate' => {'type'=>'dateTime', 'path'=>'Device.manufactureDate', 'min'=>0, 'max'=>1},
      'expirationDate' => {'type'=>'dateTime', 'path'=>'Device.expirationDate', 'min'=>0, 'max'=>1},
      'lotNumber' => {'type'=>'string', 'path'=>'Device.lotNumber', 'min'=>0, 'max'=>1},
      'serialNumber' => {'type'=>'string', 'path'=>'Device.serialNumber', 'min'=>0, 'max'=>1},
      'deviceName' => {'type'=>'Device::DeviceName', 'path'=>'Device.deviceName', 'min'=>0, 'max'=>Float::INFINITY},
      'modelNumber' => {'type'=>'string', 'path'=>'Device.modelNumber', 'min'=>0, 'max'=>1},
      'partNumber' => {'type'=>'string', 'path'=>'Device.partNumber', 'min'=>0, 'max'=>1},
      'type' => {'type'=>'CodeableConcept', 'path'=>'Device.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-type', 'uri'=>nil}},
      'specialization' => {'type'=>'Device::Specialization', 'path'=>'Device.specialization', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'Device::Version', 'path'=>'Device.version', 'min'=>0, 'max'=>Float::INFINITY},
      'property' => {'type'=>'Device::Property', 'path'=>'Device.property', 'min'=>0, 'max'=>Float::INFINITY},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Device.patient', 'min'=>0, 'max'=>1},
      'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Device.owner', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactPoint', 'path'=>'Device.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Device.location', 'min'=>0, 'max'=>1},
      'url' => {'type'=>'uri', 'path'=>'Device.url', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'Device.note', 'min'=>0, 'max'=>Float::INFINITY},
      'safety' => {'type'=>'CodeableConcept', 'path'=>'Device.safety', 'min'=>0, 'max'=>Float::INFINITY},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Device.parent', 'min'=>0, 'max'=>1}
    }

    class UdiCarrier < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'UdiCarrier.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'UdiCarrier.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'UdiCarrier.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'deviceIdentifier' => {'type'=>'string', 'path'=>'UdiCarrier.deviceIdentifier', 'min'=>0, 'max'=>1},
        'issuer' => {'type'=>'uri', 'path'=>'UdiCarrier.issuer', 'min'=>0, 'max'=>1},
        'jurisdiction' => {'type'=>'uri', 'path'=>'UdiCarrier.jurisdiction', 'min'=>0, 'max'=>1},
        'carrierAIDC' => {'type'=>'base64Binary', 'path'=>'UdiCarrier.carrierAIDC', 'min'=>0, 'max'=>1},
        'carrierHRF' => {'type'=>'string', 'path'=>'UdiCarrier.carrierHRF', 'min'=>0, 'max'=>1},
        'entryType' => {'type'=>'code', 'path'=>'UdiCarrier.entryType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/udi-entry-type|4.0.0', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :deviceIdentifier  # 0-1 string
      attr_accessor :issuer            # 0-1 uri
      attr_accessor :jurisdiction      # 0-1 uri
      attr_accessor :carrierAIDC       # 0-1 base64Binary
      attr_accessor :carrierHRF        # 0-1 string
      attr_accessor :entryType         # 0-1 code
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
        'systemType' => {'type'=>'CodeableConcept', 'path'=>'Specialization.systemType', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Specialization.version', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :systemType        # 1-1 CodeableConcept
      attr_accessor :version           # 0-1 string
    end

    class Version < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Version.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Version.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Version.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Version.type', 'min'=>0, 'max'=>1},
        'component' => {'type'=>'Identifier', 'path'=>'Version.component', 'min'=>0, 'max'=>1},
        'value' => {'type'=>'string', 'path'=>'Version.value', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :component         # 0-1 Identifier
      attr_accessor :value             # 1-1 string
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

    attr_accessor :id                 # 0-1 id
    attr_accessor :meta               # 0-1 Meta
    attr_accessor :implicitRules      # 0-1 uri
    attr_accessor :language           # 0-1 code
    attr_accessor :text               # 0-1 Narrative
    attr_accessor :contained          # 0-* [ Resource ]
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :modifierExtension  # 0-* [ Extension ]
    attr_accessor :identifier         # 0-* [ Identifier ]
    attr_accessor :definition         # 0-1 Reference(DeviceDefinition)
    attr_accessor :udiCarrier         # 0-* [ Device::UdiCarrier ]
    attr_accessor :status             # 0-1 code
    attr_accessor :statusReason       # 0-* [ CodeableConcept ]
    attr_accessor :distinctIdentifier # 0-1 string
    attr_accessor :manufacturer       # 0-1 string
    attr_accessor :manufactureDate    # 0-1 dateTime
    attr_accessor :expirationDate     # 0-1 dateTime
    attr_accessor :lotNumber          # 0-1 string
    attr_accessor :serialNumber       # 0-1 string
    attr_accessor :deviceName         # 0-* [ Device::DeviceName ]
    attr_accessor :modelNumber        # 0-1 string
    attr_accessor :partNumber         # 0-1 string
    attr_accessor :type               # 0-1 CodeableConcept
    attr_accessor :specialization     # 0-* [ Device::Specialization ]
    attr_accessor :version            # 0-* [ Device::Version ]
    attr_accessor :property           # 0-* [ Device::Property ]
    attr_accessor :patient            # 0-1 Reference(Patient)
    attr_accessor :owner              # 0-1 Reference(Organization)
    attr_accessor :contact            # 0-* [ ContactPoint ]
    attr_accessor :location           # 0-1 Reference(Location)
    attr_accessor :url                # 0-1 uri
    attr_accessor :note               # 0-* [ Annotation ]
    attr_accessor :safety             # 0-* [ CodeableConcept ]
    attr_accessor :parent             # 0-1 Reference(Device)

    def resourceType
      'Device'
    end
  end
end