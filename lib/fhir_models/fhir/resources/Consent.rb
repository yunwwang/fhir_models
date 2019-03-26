module FHIR
  class Consent < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'source' => ['Attachment', 'Reference']
    }
    SEARCH_PARAMS = ['date', 'identifier', 'patient', 'action', 'actor', 'category', 'consentor', 'data', 'organization', 'period', 'purpose', 'scope', 'security-label', 'source-reference', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Consent.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Consent.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Consent.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Consent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Consent.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Consent.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Consent.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Consent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Consent.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Consent.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-state-codes|4.0.0', 'uri'=>nil}},
      'scope' => {'type'=>'CodeableConcept', 'path'=>'Consent.scope', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-scope', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'Consent.category', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-category', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Consent.patient', 'min'=>0, 'max'=>1},
      'dateTime' => {'type'=>'dateTime', 'path'=>'Consent.dateTime', 'min'=>0, 'max'=>1},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Consent.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Consent.organization', 'min'=>0, 'max'=>Float::INFINITY},
      'sourceAttachment' => {'type'=>'Attachment', 'path'=>'Consent.source[x]', 'min'=>0, 'max'=>1},
      'sourceReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Consent', 'http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/Contract', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse'], 'type'=>'Reference', 'path'=>'Consent.source[x]', 'min'=>0, 'max'=>1},
      'policy' => {'type'=>'Consent::Policy', 'path'=>'Consent.policy', 'min'=>0, 'max'=>Float::INFINITY},
      'policyRule' => {'type'=>'CodeableConcept', 'path'=>'Consent.policyRule', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-policy', 'uri'=>nil}},
      'verification' => {'type'=>'Consent::Verification', 'path'=>'Consent.verification', 'min'=>0, 'max'=>Float::INFINITY},
      'provision' => {'type'=>'Consent::Provision', 'path'=>'Consent.provision', 'min'=>0, 'max'=>1}
    }

    class Policy < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Policy.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Policy.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Policy.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'authority' => {'type'=>'uri', 'path'=>'Policy.authority', 'min'=>0, 'max'=>1},
        'uri' => {'type'=>'uri', 'path'=>'Policy.uri', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :authority         # 0-1 uri
      attr_accessor :uri               # 0-1 uri
    end

    class Verification < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Verification.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Verification.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Verification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'verified' => {'type'=>'boolean', 'path'=>'Verification.verified', 'min'=>1, 'max'=>1},
        'verifiedWith' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Verification.verifiedWith', 'min'=>0, 'max'=>1},
        'verificationDate' => {'type'=>'dateTime', 'path'=>'Verification.verificationDate', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :verified          # 1-1 boolean
      attr_accessor :verifiedWith      # 0-1 Reference(Patient|RelatedPerson)
      attr_accessor :verificationDate  # 0-1 dateTime
    end

    class Provision < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Provision.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Provision.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Provision.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'code', 'path'=>'Provision.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-provision-type|4.0.0', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'Provision.period', 'min'=>0, 'max'=>1},
        'actor' => {'type'=>'Consent::Provision::Actor', 'path'=>'Provision.actor', 'min'=>0, 'max'=>Float::INFINITY},
        'action' => {'type'=>'CodeableConcept', 'path'=>'Provision.action', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-action', 'uri'=>nil}},
        'securityLabel' => {'type'=>'Coding', 'path'=>'Provision.securityLabel', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/security-labels', 'uri'=>nil}},
        'purpose' => {'type'=>'Coding', 'path'=>'Provision.purpose', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-PurposeOfUse', 'uri'=>nil}},
        'class' => {'local_name'=>'local_class', 'type'=>'Coding', 'path'=>'Provision.class', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-content-class', 'uri'=>nil}},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Provision.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-content-code', 'uri'=>nil}},
        'dataPeriod' => {'type'=>'Period', 'path'=>'Provision.dataPeriod', 'min'=>0, 'max'=>1},
        'data' => {'type'=>'Consent::Provision::Data', 'path'=>'Provision.data', 'min'=>0, 'max'=>Float::INFINITY},
        'provision' => {'type'=>'Consent::Provision', 'path'=>'Provision.provision', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Actor < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Actor.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Actor.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Actor.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'role' => {'type'=>'CodeableConcept', 'path'=>'Actor.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/security-role-type', 'uri'=>nil}},
          'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Actor.reference', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :role              # 1-1 CodeableConcept
        attr_accessor :reference         # 1-1 Reference(Device|Group|CareTeam|Organization|Patient|Practitioner|RelatedPerson|PractitionerRole)
      end

      class Data < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Data.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Data.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Data.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'meaning' => {'type'=>'code', 'path'=>'Data.meaning', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/consent-data-meaning|4.0.0', 'uri'=>nil}},
          'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Data.reference', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :meaning           # 1-1 code
        attr_accessor :reference         # 1-1 Reference(Resource)
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 code
      attr_accessor :period            # 0-1 Period
      attr_accessor :actor             # 0-* [ Consent::Provision::Actor ]
      attr_accessor :action            # 0-* [ CodeableConcept ]
      attr_accessor :securityLabel     # 0-* [ Coding ]
      attr_accessor :purpose           # 0-* [ Coding ]
      attr_accessor :local_class       # 0-* [ Coding ]
      attr_accessor :code              # 0-* [ CodeableConcept ]
      attr_accessor :dataPeriod        # 0-1 Period
      attr_accessor :data              # 0-* [ Consent::Provision::Data ]
      attr_accessor :provision         # 0-* [ Consent::Provision ]
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
    attr_accessor :status            # 1-1 code
    attr_accessor :scope             # 1-1 CodeableConcept
    attr_accessor :category          # 1-* [ CodeableConcept ]
    attr_accessor :patient           # 0-1 Reference(Patient)
    attr_accessor :dateTime          # 0-1 dateTime
    attr_accessor :performer         # 0-* [ Reference(Organization|Patient|Practitioner|RelatedPerson|PractitionerRole) ]
    attr_accessor :organization      # 0-* [ Reference(Organization) ]
    attr_accessor :sourceAttachment  # 0-1 Attachment
    attr_accessor :sourceReference   # 0-1 Reference(Consent|DocumentReference|Contract|QuestionnaireResponse)
    attr_accessor :policy            # 0-* [ Consent::Policy ]
    attr_accessor :policyRule        # 0-1 CodeableConcept
    attr_accessor :verification      # 0-* [ Consent::Verification ]
    attr_accessor :provision         # 0-1 Consent::Provision

    def resourceType
      'Consent'
    end
  end
end