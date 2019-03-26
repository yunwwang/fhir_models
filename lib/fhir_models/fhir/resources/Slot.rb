module FHIR
  class Slot < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['appointment-type', 'identifier', 'schedule', 'service-category', 'service-type', 'specialty', 'start', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Slot.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Slot.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Slot.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Slot.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Slot.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Slot.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Slot.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Slot.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Slot.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'serviceCategory' => {'type'=>'CodeableConcept', 'path'=>'Slot.serviceCategory', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-category', 'uri'=>nil}},
      'serviceType' => {'type'=>'CodeableConcept', 'path'=>'Slot.serviceType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-type', 'uri'=>nil}},
      'specialty' => {'type'=>'CodeableConcept', 'path'=>'Slot.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes', 'uri'=>nil}},
      'appointmentType' => {'type'=>'CodeableConcept', 'path'=>'Slot.appointmentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0276', 'uri'=>nil}},
      'schedule' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Schedule'], 'type'=>'Reference', 'path'=>'Slot.schedule', 'min'=>1, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'Slot.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/slotstatus|4.0.0', 'uri'=>nil}},
      'start' => {'type'=>'instant', 'path'=>'Slot.start', 'min'=>1, 'max'=>1},
      'end' => {'type'=>'instant', 'path'=>'Slot.end', 'min'=>1, 'max'=>1},
      'overbooked' => {'type'=>'boolean', 'path'=>'Slot.overbooked', 'min'=>0, 'max'=>1},
      'comment' => {'type'=>'string', 'path'=>'Slot.comment', 'min'=>0, 'max'=>1}
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
    attr_accessor :serviceCategory   # 0-* [ CodeableConcept ]
    attr_accessor :serviceType       # 0-* [ CodeableConcept ]
    attr_accessor :specialty         # 0-* [ CodeableConcept ]
    attr_accessor :appointmentType   # 0-1 CodeableConcept
    attr_accessor :schedule          # 1-1 Reference(Schedule)
    attr_accessor :status            # 1-1 code
    attr_accessor :start             # 1-1 instant
    attr_accessor :end               # 1-1 instant
    attr_accessor :overbooked        # 0-1 boolean
    attr_accessor :comment           # 0-1 string

    def resourceType
      'Slot'
    end
  end
end