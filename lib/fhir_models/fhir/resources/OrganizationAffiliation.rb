module FHIR
  class OrganizationAffiliation < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['active', 'date', 'email', 'endpoint', 'identifier', 'location', 'network', 'participating-organization', 'phone', 'primary-organization', 'role', 'service', 'specialty', 'telecom']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'OrganizationAffiliation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'OrganizationAffiliation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'OrganizationAffiliation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'OrganizationAffiliation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'OrganizationAffiliation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'OrganizationAffiliation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'OrganizationAffiliation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'OrganizationAffiliation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'OrganizationAffiliation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'OrganizationAffiliation.active', 'min'=>0, 'max'=>1},
      'period' => {'type'=>'Period', 'path'=>'OrganizationAffiliation.period', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'OrganizationAffiliation.organization', 'min'=>0, 'max'=>1},
      'participatingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'OrganizationAffiliation.participatingOrganization', 'min'=>0, 'max'=>1},
      'network' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'OrganizationAffiliation.network', 'min'=>0, 'max'=>Float::INFINITY},
      'code' => {'type'=>'CodeableConcept', 'path'=>'OrganizationAffiliation.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/organization-role', 'uri'=>nil}},
      'specialty' => {'type'=>'CodeableConcept', 'path'=>'OrganizationAffiliation.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes', 'uri'=>nil}},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'OrganizationAffiliation.location', 'min'=>0, 'max'=>Float::INFINITY},
      'healthcareService' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'OrganizationAffiliation.healthcareService', 'min'=>0, 'max'=>Float::INFINITY},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'OrganizationAffiliation.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'OrganizationAffiliation.endpoint', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                        # 0-1 id
    attr_accessor :meta                      # 0-1 Meta
    attr_accessor :implicitRules             # 0-1 uri
    attr_accessor :language                  # 0-1 code
    attr_accessor :text                      # 0-1 Narrative
    attr_accessor :contained                 # 0-* [ Resource ]
    attr_accessor :extension                 # 0-* [ Extension ]
    attr_accessor :modifierExtension         # 0-* [ Extension ]
    attr_accessor :identifier                # 0-* [ Identifier ]
    attr_accessor :active                    # 0-1 boolean
    attr_accessor :period                    # 0-1 Period
    attr_accessor :organization              # 0-1 Reference(Organization)
    attr_accessor :participatingOrganization # 0-1 Reference(Organization)
    attr_accessor :network                   # 0-* [ Reference(Organization) ]
    attr_accessor :code                      # 0-* [ CodeableConcept ]
    attr_accessor :specialty                 # 0-* [ CodeableConcept ]
    attr_accessor :location                  # 0-* [ Reference(Location) ]
    attr_accessor :healthcareService         # 0-* [ Reference(HealthcareService) ]
    attr_accessor :telecom                   # 0-* [ ContactPoint ]
    attr_accessor :endpoint                  # 0-* [ Reference(Endpoint) ]

    def resourceType
      'OrganizationAffiliation'
    end
  end
end