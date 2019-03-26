module FHIR
  class PaymentReconciliation < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['created', 'disposition', 'identifier', 'outcome', 'payment-issuer', 'request', 'requestor', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'PaymentReconciliation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'PaymentReconciliation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'PaymentReconciliation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'PaymentReconciliation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'PaymentReconciliation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'PaymentReconciliation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'PaymentReconciliation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'PaymentReconciliation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'PaymentReconciliation.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/fm-status|4.0.0', 'uri'=>nil}},
      'period' => {'type'=>'Period', 'path'=>'PaymentReconciliation.period', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'PaymentReconciliation.created', 'min'=>1, 'max'=>1},
      'paymentIssuer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.paymentIssuer', 'min'=>0, 'max'=>1},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.request', 'min'=>0, 'max'=>1},
      'requestor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.requestor', 'min'=>0, 'max'=>1},
      'outcome' => {'type'=>'code', 'path'=>'PaymentReconciliation.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/remittance-outcome|4.0.0', 'uri'=>nil}},
      'disposition' => {'type'=>'string', 'path'=>'PaymentReconciliation.disposition', 'min'=>0, 'max'=>1},
      'paymentDate' => {'type'=>'date', 'path'=>'PaymentReconciliation.paymentDate', 'min'=>1, 'max'=>1},
      'paymentAmount' => {'type'=>'Money', 'path'=>'PaymentReconciliation.paymentAmount', 'min'=>1, 'max'=>1},
      'paymentIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.paymentIdentifier', 'min'=>0, 'max'=>1},
      'detail' => {'type'=>'PaymentReconciliation::Detail', 'path'=>'PaymentReconciliation.detail', 'min'=>0, 'max'=>Float::INFINITY},
      'formCode' => {'type'=>'CodeableConcept', 'path'=>'PaymentReconciliation.formCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/forms', 'uri'=>nil}},
      'processNote' => {'type'=>'PaymentReconciliation::ProcessNote', 'path'=>'PaymentReconciliation.processNote', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Detail < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Detail.identifier', 'min'=>0, 'max'=>1},
        'predecessor' => {'type'=>'Identifier', 'path'=>'Detail.predecessor', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Detail.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/payment-type', 'uri'=>nil}},
        'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Detail.request', 'min'=>0, 'max'=>1},
        'submitter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Detail.submitter', 'min'=>0, 'max'=>1},
        'response' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Detail.response', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'date', 'path'=>'Detail.date', 'min'=>0, 'max'=>1},
        'responsible' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Detail.responsible', 'min'=>0, 'max'=>1},
        'payee' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Detail.payee', 'min'=>0, 'max'=>1},
        'amount' => {'type'=>'Money', 'path'=>'Detail.amount', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-1 Identifier
      attr_accessor :predecessor       # 0-1 Identifier
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :request           # 0-1 Reference(Resource)
      attr_accessor :submitter         # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :response          # 0-1 Reference(Resource)
      attr_accessor :date              # 0-1 date
      attr_accessor :responsible       # 0-1 Reference(PractitionerRole)
      attr_accessor :payee             # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :amount            # 0-1 Money
    end

    class ProcessNote < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ProcessNote.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ProcessNote.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ProcessNote.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'code', 'path'=>'ProcessNote.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/note-type|4.0.0', 'uri'=>nil}},
        'text' => {'type'=>'string', 'path'=>'ProcessNote.text', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 code
      attr_accessor :text              # 0-1 string
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
    attr_accessor :period            # 0-1 Period
    attr_accessor :created           # 1-1 dateTime
    attr_accessor :paymentIssuer     # 0-1 Reference(Organization)
    attr_accessor :request           # 0-1 Reference(Task)
    attr_accessor :requestor         # 0-1 Reference(Practitioner|PractitionerRole|Organization)
    attr_accessor :outcome           # 0-1 code
    attr_accessor :disposition       # 0-1 string
    attr_accessor :paymentDate       # 1-1 date
    attr_accessor :paymentAmount     # 1-1 Money
    attr_accessor :paymentIdentifier # 0-1 Identifier
    attr_accessor :detail            # 0-* [ PaymentReconciliation::Detail ]
    attr_accessor :formCode          # 0-1 CodeableConcept
    attr_accessor :processNote       # 0-* [ PaymentReconciliation::ProcessNote ]

    def resourceType
      'PaymentReconciliation'
    end
  end
end