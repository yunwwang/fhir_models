module FHIR
  class AuditEvent < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['action', 'address', 'agent', 'agent-name', 'agent-role', 'altid', 'date', 'entity', 'entity-name', 'entity-role', 'entity-type', 'outcome', 'patient', 'policy', 'site', 'source', 'subtype', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'AuditEvent.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'AuditEvent.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'AuditEvent.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'AuditEvent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'AuditEvent.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'AuditEvent.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'AuditEvent.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'AuditEvent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'type'=>'Coding', 'path'=>'AuditEvent.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/audit-event-type', 'uri'=>nil}},
      'subtype' => {'type'=>'Coding', 'path'=>'AuditEvent.subtype', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/audit-event-sub-type', 'uri'=>nil}},
      'action' => {'type'=>'code', 'path'=>'AuditEvent.action', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/audit-event-action|4.0.0', 'uri'=>nil}},
      'period' => {'type'=>'Period', 'path'=>'AuditEvent.period', 'min'=>0, 'max'=>1},
      'recorded' => {'type'=>'instant', 'path'=>'AuditEvent.recorded', 'min'=>1, 'max'=>1},
      'outcome' => {'type'=>'code', 'path'=>'AuditEvent.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/audit-event-outcome|4.0.0', 'uri'=>nil}},
      'outcomeDesc' => {'type'=>'string', 'path'=>'AuditEvent.outcomeDesc', 'min'=>0, 'max'=>1},
      'purposeOfEvent' => {'type'=>'CodeableConcept', 'path'=>'AuditEvent.purposeOfEvent', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-PurposeOfUse', 'uri'=>nil}},
      'agent' => {'type'=>'AuditEvent::Agent', 'path'=>'AuditEvent.agent', 'min'=>1, 'max'=>Float::INFINITY},
      'source' => {'type'=>'AuditEvent::Source', 'path'=>'AuditEvent.source', 'min'=>1, 'max'=>1},
      'entity' => {'type'=>'AuditEvent::Entity', 'path'=>'AuditEvent.entity', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Agent < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Agent.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/participation-role-type', 'uri'=>nil}},
        'role' => {'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/security-role-type', 'uri'=>nil}},
        'who' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Agent.who', 'min'=>0, 'max'=>1},
        'altId' => {'type'=>'string', 'path'=>'Agent.altId', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'Agent.name', 'min'=>0, 'max'=>1},
        'requestor' => {'type'=>'boolean', 'path'=>'Agent.requestor', 'min'=>1, 'max'=>1},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Agent.location', 'min'=>0, 'max'=>1},
        'policy' => {'type'=>'uri', 'path'=>'Agent.policy', 'min'=>0, 'max'=>Float::INFINITY},
        'media' => {'type'=>'Coding', 'path'=>'Agent.media', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/dicm-405-mediatype', 'uri'=>nil}},
        'network' => {'type'=>'AuditEvent::Agent::Network', 'path'=>'Agent.network', 'min'=>0, 'max'=>1},
        'purposeOfUse' => {'type'=>'CodeableConcept', 'path'=>'Agent.purposeOfUse', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-PurposeOfUse', 'uri'=>nil}}
      }

      class Network < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Network.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Network.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Network.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'address' => {'type'=>'string', 'path'=>'Network.address', 'min'=>0, 'max'=>1},
          'type' => {'type'=>'code', 'path'=>'Network.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/network-type|4.0.0', 'uri'=>nil}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :address           # 0-1 string
        attr_accessor :type              # 0-1 code
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :role              # 0-* [ CodeableConcept ]
      attr_accessor :who               # 0-1 Reference(PractitionerRole|Practitioner|Organization|Device|Patient|RelatedPerson)
      attr_accessor :altId             # 0-1 string
      attr_accessor :name              # 0-1 string
      attr_accessor :requestor         # 1-1 boolean
      attr_accessor :location          # 0-1 Reference(Location)
      attr_accessor :policy            # 0-* [ uri ]
      attr_accessor :media             # 0-1 Coding
      attr_accessor :network           # 0-1 AuditEvent::Agent::Network
      attr_accessor :purposeOfUse      # 0-* [ CodeableConcept ]
    end

    class Source < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Source.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Source.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Source.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'site' => {'type'=>'string', 'path'=>'Source.site', 'min'=>0, 'max'=>1},
        'observer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Source.observer', 'min'=>1, 'max'=>1},
        'type' => {'type'=>'Coding', 'path'=>'Source.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/audit-source-type', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :site              # 0-1 string
      attr_accessor :observer          # 1-1 Reference(PractitionerRole|Practitioner|Organization|Device|Patient|RelatedPerson)
      attr_accessor :type              # 0-* [ Coding ]
    end

    class Entity < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Entity.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Entity.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Entity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'what' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Entity.what', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'Coding', 'path'=>'Entity.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/audit-entity-type', 'uri'=>nil}},
        'role' => {'type'=>'Coding', 'path'=>'Entity.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/object-role', 'uri'=>nil}},
        'lifecycle' => {'type'=>'Coding', 'path'=>'Entity.lifecycle', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/object-lifecycle-events', 'uri'=>nil}},
        'securityLabel' => {'type'=>'Coding', 'path'=>'Entity.securityLabel', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/security-labels', 'uri'=>nil}},
        'name' => {'type'=>'string', 'path'=>'Entity.name', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Entity.description', 'min'=>0, 'max'=>1},
        'query' => {'type'=>'base64Binary', 'path'=>'Entity.query', 'min'=>0, 'max'=>1},
        'detail' => {'type'=>'AuditEvent::Entity::Detail', 'path'=>'Entity.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['string', 'base64Binary']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'string', 'path'=>'Detail.type', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
          'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 string
        attr_accessor :valueString       # 1-1 string
        attr_accessor :valueBase64Binary # 1-1 base64Binary
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :what              # 0-1 Reference(Resource)
      attr_accessor :type              # 0-1 Coding
      attr_accessor :role              # 0-1 Coding
      attr_accessor :lifecycle         # 0-1 Coding
      attr_accessor :securityLabel     # 0-* [ Coding ]
      attr_accessor :name              # 0-1 string
      attr_accessor :description       # 0-1 string
      attr_accessor :query             # 0-1 base64Binary
      attr_accessor :detail            # 0-* [ AuditEvent::Entity::Detail ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :type              # 1-1 Coding
    attr_accessor :subtype           # 0-* [ Coding ]
    attr_accessor :action            # 0-1 code
    attr_accessor :period            # 0-1 Period
    attr_accessor :recorded          # 1-1 instant
    attr_accessor :outcome           # 0-1 code
    attr_accessor :outcomeDesc       # 0-1 string
    attr_accessor :purposeOfEvent    # 0-* [ CodeableConcept ]
    attr_accessor :agent             # 1-* [ AuditEvent::Agent ]
    attr_accessor :source            # 1-1 AuditEvent::Source
    attr_accessor :entity            # 0-* [ AuditEvent::Entity ]

    def resourceType
      'AuditEvent'
    end
  end
end