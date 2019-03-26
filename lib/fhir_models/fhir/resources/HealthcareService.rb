module FHIR
  class HealthcareService < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['active', 'characteristic', 'coverage-area', 'endpoint', 'identifier', 'location', 'name', 'organization', 'program', 'service-category', 'service-type', 'specialty']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'HealthcareService.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'HealthcareService.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'HealthcareService.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'HealthcareService.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'HealthcareService.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'HealthcareService.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'HealthcareService.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'HealthcareService.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'HealthcareService.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'HealthcareService.active', 'min'=>0, 'max'=>1},
      'providedBy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'HealthcareService.providedBy', 'min'=>0, 'max'=>1},
      'category' => {'type'=>'CodeableConcept', 'path'=>'HealthcareService.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-category', 'uri'=>nil}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'HealthcareService.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-type', 'uri'=>nil}},
      'specialty' => {'type'=>'CodeableConcept', 'path'=>'HealthcareService.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes', 'uri'=>nil}},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'HealthcareService.location', 'min'=>0, 'max'=>Float::INFINITY},
      'name' => {'type'=>'string', 'path'=>'HealthcareService.name', 'min'=>0, 'max'=>1},
      'comment' => {'type'=>'string', 'path'=>'HealthcareService.comment', 'min'=>0, 'max'=>1},
      'extraDetails' => {'type'=>'markdown', 'path'=>'HealthcareService.extraDetails', 'min'=>0, 'max'=>1},
      'photo' => {'type'=>'Attachment', 'path'=>'HealthcareService.photo', 'min'=>0, 'max'=>1},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'HealthcareService.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'coverageArea' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'HealthcareService.coverageArea', 'min'=>0, 'max'=>Float::INFINITY},
      'serviceProvisionCode' => {'type'=>'CodeableConcept', 'path'=>'HealthcareService.serviceProvisionCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-provision-conditions', 'uri'=>nil}},
      'eligibility' => {'type'=>'HealthcareService::Eligibility', 'path'=>'HealthcareService.eligibility', 'min'=>0, 'max'=>Float::INFINITY},
      'program' => {'type'=>'CodeableConcept', 'path'=>'HealthcareService.program', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/program', 'uri'=>nil}},
      'characteristic' => {'type'=>'CodeableConcept', 'path'=>'HealthcareService.characteristic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'communication' => {'type'=>'CodeableConcept', 'path'=>'HealthcareService.communication', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'referralMethod' => {'type'=>'CodeableConcept', 'path'=>'HealthcareService.referralMethod', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-referral-method', 'uri'=>nil}},
      'appointmentRequired' => {'type'=>'boolean', 'path'=>'HealthcareService.appointmentRequired', 'min'=>0, 'max'=>1},
      'availableTime' => {'type'=>'HealthcareService::AvailableTime', 'path'=>'HealthcareService.availableTime', 'min'=>0, 'max'=>Float::INFINITY},
      'notAvailable' => {'type'=>'HealthcareService::NotAvailable', 'path'=>'HealthcareService.notAvailable', 'min'=>0, 'max'=>Float::INFINITY},
      'availabilityExceptions' => {'type'=>'string', 'path'=>'HealthcareService.availabilityExceptions', 'min'=>0, 'max'=>1},
      'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'HealthcareService.endpoint', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Eligibility < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Eligibility.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Eligibility.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Eligibility.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Eligibility.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'comment' => {'type'=>'markdown', 'path'=>'Eligibility.comment', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 0-1 CodeableConcept
      attr_accessor :comment           # 0-1 markdown
    end

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
    attr_accessor :providedBy             # 0-1 Reference(Organization)
    attr_accessor :category               # 0-* [ CodeableConcept ]
    attr_accessor :type                   # 0-* [ CodeableConcept ]
    attr_accessor :specialty              # 0-* [ CodeableConcept ]
    attr_accessor :location               # 0-* [ Reference(Location) ]
    attr_accessor :name                   # 0-1 string
    attr_accessor :comment                # 0-1 string
    attr_accessor :extraDetails           # 0-1 markdown
    attr_accessor :photo                  # 0-1 Attachment
    attr_accessor :telecom                # 0-* [ ContactPoint ]
    attr_accessor :coverageArea           # 0-* [ Reference(Location) ]
    attr_accessor :serviceProvisionCode   # 0-* [ CodeableConcept ]
    attr_accessor :eligibility            # 0-* [ HealthcareService::Eligibility ]
    attr_accessor :program                # 0-* [ CodeableConcept ]
    attr_accessor :characteristic         # 0-* [ CodeableConcept ]
    attr_accessor :communication          # 0-* [ CodeableConcept ]
    attr_accessor :referralMethod         # 0-* [ CodeableConcept ]
    attr_accessor :appointmentRequired    # 0-1 boolean
    attr_accessor :availableTime          # 0-* [ HealthcareService::AvailableTime ]
    attr_accessor :notAvailable           # 0-* [ HealthcareService::NotAvailable ]
    attr_accessor :availabilityExceptions # 0-1 string
    attr_accessor :endpoint               # 0-* [ Reference(Endpoint) ]

    def resourceType
      'HealthcareService'
    end
  end
end