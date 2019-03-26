module FHIR
  class BodyStructure < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['identifier', 'location', 'morphology', 'patient']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'BodyStructure.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'BodyStructure.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'BodyStructure.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'BodyStructure.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'BodyStructure.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'BodyStructure.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'BodyStructure.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'BodyStructure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'BodyStructure.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'BodyStructure.active', 'min'=>0, 'max'=>1},
      'morphology' => {'type'=>'CodeableConcept', 'path'=>'BodyStructure.morphology', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/bodystructure-code', 'uri'=>nil}},
      'location' => {'type'=>'CodeableConcept', 'path'=>'BodyStructure.location', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'locationQualifier' => {'type'=>'CodeableConcept', 'path'=>'BodyStructure.locationQualifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/bodystructure-relative-location', 'uri'=>nil}},
      'description' => {'type'=>'string', 'path'=>'BodyStructure.description', 'min'=>0, 'max'=>1},
      'image' => {'type'=>'Attachment', 'path'=>'BodyStructure.image', 'min'=>0, 'max'=>Float::INFINITY},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'BodyStructure.patient', 'min'=>1, 'max'=>1}
    }

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :active            # 0-1 boolean
    attr_accessor :morphology        # 0-1 CodeableConcept
    attr_accessor :location          # 0-1 CodeableConcept
    attr_accessor :locationQualifier # 0-* [ CodeableConcept ]
    attr_accessor :description       # 0-1 string
    attr_accessor :image             # 0-* [ Attachment ]
    attr_accessor :patient           # 1-1 Reference(Patient)

    def resourceType
      'BodyStructure'
    end
  end
end