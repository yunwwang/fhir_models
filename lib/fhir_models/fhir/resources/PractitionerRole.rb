module FHIR
  class PractitionerRole < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['email', 'phone', 'telecom', 'active', 'date', 'endpoint', 'identifier', 'location', 'organization', 'practitioner', 'role', 'service', 'specialty']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'PractitionerRole.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'PractitionerRole.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'PractitionerRole.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'PractitionerRole.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'PractitionerRole.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'PractitionerRole.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'PractitionerRole.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'PractitionerRole.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'PractitionerRole.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'PractitionerRole.active', 'min'=>0, 'max'=>1},
      'period' => {'type'=>'Period', 'path'=>'PractitionerRole.period', 'min'=>0, 'max'=>1},
      'practitioner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'PractitionerRole.practitioner', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PractitionerRole.organization', 'min'=>0, 'max'=>1},
      'code' => {'type'=>'CodeableConcept', 'path'=>'PractitionerRole.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/practitioner-role', 'uri'=>nil}},
      'specialty' => {'type'=>'CodeableConcept', 'path'=>'PractitionerRole.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes', 'uri'=>nil}},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'PractitionerRole.location', 'min'=>0, 'max'=>Float::INFINITY},
      'healthcareService' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'PractitionerRole.healthcareService', 'min'=>0, 'max'=>Float::INFINITY},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'PractitionerRole.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'availableTime' => {'type'=>'PractitionerRole::AvailableTime', 'path'=>'PractitionerRole.availableTime', 'min'=>0, 'max'=>Float::INFINITY},
      'notAvailable' => {'type'=>'PractitionerRole::NotAvailable', 'path'=>'PractitionerRole.notAvailable', 'min'=>0, 'max'=>Float::INFINITY},
      'availabilityExceptions' => {'type'=>'string', 'path'=>'PractitionerRole.availabilityExceptions', 'min'=>0, 'max'=>1},
      'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'PractitionerRole.endpoint', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class AvailableTime < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'AvailableTime.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'AvailableTime.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'AvailableTime.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'daysOfWeek' => {'type'=>'code', 'path'=>'AvailableTime.daysOfWeek', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/days-of-week|4.0.0', 'uri'=>nil}},
        'allDay' => {'type'=>'boolean', 'path'=>'AvailableTime.allDay', 'min'=>0, 'max'=>1},
        'availableStartTime' => {'type'=>'time', 'path'=>'AvailableTime.availableStartTime', 'min'=>0, 'max'=>1},
        'availableEndTime' => {'type'=>'time', 'path'=>'AvailableTime.availableEndTime', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                 # 0-1 string
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :daysOfWeek         # 0-* [ code ]
      attr_accessor :allDay             # 0-1 boolean
      attr_accessor :availableStartTime # 0-1 time
      attr_accessor :availableEndTime   # 0-1 time
    end

    class NotAvailable < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'NotAvailable.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'NotAvailable.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'NotAvailable.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'NotAvailable.description', 'min'=>1, 'max'=>1},
        'during' => {'type'=>'Period', 'path'=>'NotAvailable.during', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :description       # 1-1 string
      attr_accessor :during            # 0-1 Period
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
    attr_accessor :active                 # 0-1 boolean
    attr_accessor :period                 # 0-1 Period
    attr_accessor :practitioner           # 0-1 Reference(Practitioner)
    attr_accessor :organization           # 0-1 Reference(Organization)
    attr_accessor :code                   # 0-* [ CodeableConcept ]
    attr_accessor :specialty              # 0-* [ CodeableConcept ]
    attr_accessor :location               # 0-* [ Reference(Location) ]
    attr_accessor :healthcareService      # 0-* [ Reference(HealthcareService) ]
    attr_accessor :telecom                # 0-* [ ContactPoint ]
    attr_accessor :availableTime          # 0-* [ PractitionerRole::AvailableTime ]
    attr_accessor :notAvailable           # 0-* [ PractitionerRole::NotAvailable ]
    attr_accessor :availabilityExceptions # 0-1 string
    attr_accessor :endpoint               # 0-* [ Reference(Endpoint) ]

    def resourceType
      'PractitionerRole'
    end
  end
end