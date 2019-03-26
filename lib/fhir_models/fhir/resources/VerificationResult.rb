module FHIR
  class VerificationResult < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['target']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'VerificationResult.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'VerificationResult.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'VerificationResult.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'VerificationResult.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'VerificationResult.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'VerificationResult.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'VerificationResult.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'VerificationResult.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'VerificationResult.target', 'min'=>0, 'max'=>Float::INFINITY},
      'targetLocation' => {'type'=>'string', 'path'=>'VerificationResult.targetLocation', 'min'=>0, 'max'=>Float::INFINITY},
      'need' => {'type'=>'CodeableConcept', 'path'=>'VerificationResult.need', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-need', 'uri'=>nil}},
      'status' => {'type'=>'code', 'path'=>'VerificationResult.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-status|4.0.0', 'uri'=>nil}},
      'statusDate' => {'type'=>'dateTime', 'path'=>'VerificationResult.statusDate', 'min'=>0, 'max'=>1},
      'validationType' => {'type'=>'CodeableConcept', 'path'=>'VerificationResult.validationType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-validation-type', 'uri'=>nil}},
      'validationProcess' => {'type'=>'CodeableConcept', 'path'=>'VerificationResult.validationProcess', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-validation-process', 'uri'=>nil}},
      'frequency' => {'type'=>'Timing', 'path'=>'VerificationResult.frequency', 'min'=>0, 'max'=>1},
      'lastPerformed' => {'type'=>'dateTime', 'path'=>'VerificationResult.lastPerformed', 'min'=>0, 'max'=>1},
      'nextScheduled' => {'type'=>'date', 'path'=>'VerificationResult.nextScheduled', 'min'=>0, 'max'=>1},
      'failureAction' => {'type'=>'CodeableConcept', 'path'=>'VerificationResult.failureAction', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-failure-action', 'uri'=>nil}},
      'primarySource' => {'type'=>'VerificationResult::PrimarySource', 'path'=>'VerificationResult.primarySource', 'min'=>0, 'max'=>Float::INFINITY},
      'attestation' => {'type'=>'VerificationResult::Attestation', 'path'=>'VerificationResult.attestation', 'min'=>0, 'max'=>1},
      'validator' => {'type'=>'VerificationResult::Validator', 'path'=>'VerificationResult.validator', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class PrimarySource < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'PrimarySource.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'PrimarySource.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'PrimarySource.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'who' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'PrimarySource.who', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'PrimarySource.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-primary-source-type', 'uri'=>nil}},
        'communicationMethod' => {'type'=>'CodeableConcept', 'path'=>'PrimarySource.communicationMethod', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-communication-method', 'uri'=>nil}},
        'validationStatus' => {'type'=>'CodeableConcept', 'path'=>'PrimarySource.validationStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-validation-status', 'uri'=>nil}},
        'validationDate' => {'type'=>'dateTime', 'path'=>'PrimarySource.validationDate', 'min'=>0, 'max'=>1},
        'canPushUpdates' => {'type'=>'CodeableConcept', 'path'=>'PrimarySource.canPushUpdates', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-can-push-updates', 'uri'=>nil}},
        'pushTypeAvailable' => {'type'=>'CodeableConcept', 'path'=>'PrimarySource.pushTypeAvailable', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-push-type-available', 'uri'=>nil}}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :who                 # 0-1 Reference(Organization|Practitioner|PractitionerRole)
      attr_accessor :type                # 0-* [ CodeableConcept ]
      attr_accessor :communicationMethod # 0-* [ CodeableConcept ]
      attr_accessor :validationStatus    # 0-1 CodeableConcept
      attr_accessor :validationDate      # 0-1 dateTime
      attr_accessor :canPushUpdates      # 0-1 CodeableConcept
      attr_accessor :pushTypeAvailable   # 0-* [ CodeableConcept ]
    end

    class Attestation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Attestation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Attestation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Attestation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'who' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Attestation.who', 'min'=>0, 'max'=>1},
        'onBehalfOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Attestation.onBehalfOf', 'min'=>0, 'max'=>1},
        'communicationMethod' => {'type'=>'CodeableConcept', 'path'=>'Attestation.communicationMethod', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/verificationresult-communication-method', 'uri'=>nil}},
        'date' => {'type'=>'date', 'path'=>'Attestation.date', 'min'=>0, 'max'=>1},
        'sourceIdentityCertificate' => {'type'=>'string', 'path'=>'Attestation.sourceIdentityCertificate', 'min'=>0, 'max'=>1},
        'proxyIdentityCertificate' => {'type'=>'string', 'path'=>'Attestation.proxyIdentityCertificate', 'min'=>0, 'max'=>1},
        'proxySignature' => {'type'=>'Signature', 'path'=>'Attestation.proxySignature', 'min'=>0, 'max'=>1},
        'sourceSignature' => {'type'=>'Signature', 'path'=>'Attestation.sourceSignature', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                        # 0-1 string
      attr_accessor :extension                 # 0-* [ Extension ]
      attr_accessor :modifierExtension         # 0-* [ Extension ]
      attr_accessor :who                       # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :onBehalfOf                # 0-1 Reference(Organization|Practitioner|PractitionerRole)
      attr_accessor :communicationMethod       # 0-1 CodeableConcept
      attr_accessor :date                      # 0-1 date
      attr_accessor :sourceIdentityCertificate # 0-1 string
      attr_accessor :proxyIdentityCertificate  # 0-1 string
      attr_accessor :proxySignature            # 0-1 Signature
      attr_accessor :sourceSignature           # 0-1 Signature
    end

    class Validator < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Validator.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Validator.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Validator.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Validator.organization', 'min'=>1, 'max'=>1},
        'identityCertificate' => {'type'=>'string', 'path'=>'Validator.identityCertificate', 'min'=>0, 'max'=>1},
        'attestationSignature' => {'type'=>'Signature', 'path'=>'Validator.attestationSignature', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :organization         # 1-1 Reference(Organization)
      attr_accessor :identityCertificate  # 0-1 string
      attr_accessor :attestationSignature # 0-1 Signature
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :target            # 0-* [ Reference(Resource) ]
    attr_accessor :targetLocation    # 0-* [ string ]
    attr_accessor :need              # 0-1 CodeableConcept
    attr_accessor :status            # 1-1 code
    attr_accessor :statusDate        # 0-1 dateTime
    attr_accessor :validationType    # 0-1 CodeableConcept
    attr_accessor :validationProcess # 0-* [ CodeableConcept ]
    attr_accessor :frequency         # 0-1 Timing
    attr_accessor :lastPerformed     # 0-1 dateTime
    attr_accessor :nextScheduled     # 0-1 date
    attr_accessor :failureAction     # 0-1 CodeableConcept
    attr_accessor :primarySource     # 0-* [ VerificationResult::PrimarySource ]
    attr_accessor :attestation       # 0-1 VerificationResult::Attestation
    attr_accessor :validator         # 0-* [ VerificationResult::Validator ]

    def resourceType
      'VerificationResult'
    end
  end
end