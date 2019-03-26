module FHIR
  class DocumentReference < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['identifier', 'patient', 'type', 'encounter', 'authenticator', 'author', 'category', 'contenttype', 'custodian', 'date', 'description', 'event', 'facility', 'format', 'language', 'location', 'period', 'related', 'relatesto', 'relation', 'security-label', 'setting', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DocumentReference.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DocumentReference.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DocumentReference.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DocumentReference.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'DocumentReference.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DocumentReference.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DocumentReference.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DocumentReference.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'masterIdentifier' => {'type'=>'Identifier', 'path'=>'DocumentReference.masterIdentifier', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'DocumentReference.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'DocumentReference.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/document-reference-status|4.0.0', 'uri'=>nil}},
      'docStatus' => {'type'=>'code', 'path'=>'DocumentReference.docStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/composition-status|4.0.0', 'uri'=>nil}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'DocumentReference.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-doc-typecodes', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'DocumentReference.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/document-classcodes', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DocumentReference.subject', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'instant', 'path'=>'DocumentReference.date', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'DocumentReference.author', 'min'=>0, 'max'=>Float::INFINITY},
      'authenticator' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DocumentReference.authenticator', 'min'=>0, 'max'=>1},
      'custodian' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DocumentReference.custodian', 'min'=>0, 'max'=>1},
      'relatesTo' => {'type'=>'DocumentReference::RelatesTo', 'path'=>'DocumentReference.relatesTo', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'string', 'path'=>'DocumentReference.description', 'min'=>0, 'max'=>1},
      'securityLabel' => {'type'=>'CodeableConcept', 'path'=>'DocumentReference.securityLabel', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/security-labels', 'uri'=>nil}},
      'content' => {'type'=>'DocumentReference::Content', 'path'=>'DocumentReference.content', 'min'=>1, 'max'=>Float::INFINITY},
      'context' => {'type'=>'DocumentReference::Context', 'path'=>'DocumentReference.context', 'min'=>0, 'max'=>1}
    }

    class RelatesTo < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'RelatesTo.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'RelatesTo.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatesTo.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'code', 'path'=>'RelatesTo.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/document-relationship-type|4.0.0', 'uri'=>nil}},
        'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'RelatesTo.target', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 code
      attr_accessor :target            # 1-1 Reference(DocumentReference)
    end

    class Content < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Content.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Content.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Content.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'attachment' => {'type'=>'Attachment', 'path'=>'Content.attachment', 'min'=>1, 'max'=>1},
        'format' => {'type'=>'Coding', 'path'=>'Content.format', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/formatcodes', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :attachment        # 1-1 Attachment
      attr_accessor :format            # 0-1 Coding
    end

    class Context < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Context.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Context.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Context.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'Context.encounter', 'min'=>0, 'max'=>Float::INFINITY},
        'event' => {'type'=>'CodeableConcept', 'path'=>'Context.event', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActCode', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'Context.period', 'min'=>0, 'max'=>1},
        'facilityType' => {'type'=>'CodeableConcept', 'path'=>'Context.facilityType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-facilitycodes', 'uri'=>nil}},
        'practiceSetting' => {'type'=>'CodeableConcept', 'path'=>'Context.practiceSetting', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes', 'uri'=>nil}},
        'sourcePatientInfo' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Context.sourcePatientInfo', 'min'=>0, 'max'=>1},
        'related' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Context.related', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :encounter         # 0-* [ Reference(Encounter|EpisodeOfCare) ]
      attr_accessor :event             # 0-* [ CodeableConcept ]
      attr_accessor :period            # 0-1 Period
      attr_accessor :facilityType      # 0-1 CodeableConcept
      attr_accessor :practiceSetting   # 0-1 CodeableConcept
      attr_accessor :sourcePatientInfo # 0-1 Reference(Patient)
      attr_accessor :related           # 0-* [ Reference(Resource) ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :masterIdentifier  # 0-1 Identifier
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :status            # 1-1 code
    attr_accessor :docStatus         # 0-1 code
    attr_accessor :type              # 0-1 CodeableConcept
    attr_accessor :category          # 0-* [ CodeableConcept ]
    attr_accessor :subject           # 0-1 Reference(Patient|Practitioner|Group|Device)
    attr_accessor :date              # 0-1 instant
    attr_accessor :author            # 0-* [ Reference(Practitioner|PractitionerRole|Organization|Device|Patient|RelatedPerson) ]
    attr_accessor :authenticator     # 0-1 Reference(Practitioner|PractitionerRole|Organization)
    attr_accessor :custodian         # 0-1 Reference(Organization)
    attr_accessor :relatesTo         # 0-* [ DocumentReference::RelatesTo ]
    attr_accessor :description       # 0-1 string
    attr_accessor :securityLabel     # 0-* [ CodeableConcept ]
    attr_accessor :content           # 1-* [ DocumentReference::Content ]
    attr_accessor :context           # 0-1 DocumentReference::Context

    def resourceType
      'DocumentReference'
    end
  end
end