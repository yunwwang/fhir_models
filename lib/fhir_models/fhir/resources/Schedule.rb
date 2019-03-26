module FHIR
  class Schedule < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['active', 'actor', 'date', 'identifier', 'service-category', 'service-type', 'specialty']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Schedule.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Schedule.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Schedule.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Schedule.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Schedule.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Schedule.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Schedule.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Schedule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Schedule.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'Schedule.active', 'min'=>0, 'max'=>1},
      'serviceCategory' => {'type'=>'CodeableConcept', 'path'=>'Schedule.serviceCategory', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-category', 'uri'=>nil}},
      'serviceType' => {'type'=>'CodeableConcept', 'path'=>'Schedule.serviceType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-type', 'uri'=>nil}},
      'specialty' => {'type'=>'CodeableConcept', 'path'=>'Schedule.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes', 'uri'=>nil}},
      'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Schedule.actor', 'min'=>1, 'max'=>Float::INFINITY},
      'planningHorizon' => {'type'=>'Period', 'path'=>'Schedule.planningHorizon', 'min'=>0, 'max'=>1},
      'comment' => {'type'=>'string', 'path'=>'Schedule.comment', 'min'=>0, 'max'=>1}
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
    attr_accessor :serviceCategory   # 0-* [ CodeableConcept ]
    attr_accessor :serviceType       # 0-* [ CodeableConcept ]
    attr_accessor :specialty         # 0-* [ CodeableConcept ]
    attr_accessor :actor             # 1-* [ Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Device|HealthcareService|Location) ]
    attr_accessor :planningHorizon   # 0-1 Period
    attr_accessor :comment           # 0-1 string

    def resourceType
      'Schedule'
    end
  end
end