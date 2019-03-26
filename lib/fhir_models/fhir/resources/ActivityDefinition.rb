module FHIR
  class ActivityDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'subject' => ['CodeableConcept', 'Reference'],
      'timing' => ['Timing', 'dateTime', 'Age', 'Period', 'Range', 'Duration'],
      'product' => ['Reference', 'CodeableConcept']
    }
    SEARCH_PARAMS = ['composed-of', 'context', 'context-quantity', 'context-type', 'date', 'depends-on', 'derived-from', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'predecessor', 'publisher', 'status', 'successor', 'title', 'topic', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ActivityDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ActivityDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ActivityDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ActivityDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ActivityDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ActivityDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ActivityDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ActivityDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'ActivityDefinition.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'ActivityDefinition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'ActivityDefinition.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'ActivityDefinition.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'ActivityDefinition.title', 'min'=>0, 'max'=>1},
      'subtitle' => {'type'=>'string', 'path'=>'ActivityDefinition.subtitle', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'ActivityDefinition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/publication-status|4.0.0', 'uri'=>nil}},
      'experimental' => {'type'=>'boolean', 'path'=>'ActivityDefinition.experimental', 'min'=>0, 'max'=>1},
      'subjectCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ActivityDefinition.subject[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/subject-type', 'uri'=>nil}},
      'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'ActivityDefinition.subject[x]', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ActivityDefinition.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'ActivityDefinition.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'ActivityDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'ActivityDefinition.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'ActivityDefinition.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'type'=>'CodeableConcept', 'path'=>'ActivityDefinition.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/jurisdiction', 'uri'=>nil}},
      'purpose' => {'type'=>'markdown', 'path'=>'ActivityDefinition.purpose', 'min'=>0, 'max'=>1},
      'usage' => {'type'=>'string', 'path'=>'ActivityDefinition.usage', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'markdown', 'path'=>'ActivityDefinition.copyright', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'ActivityDefinition.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'ActivityDefinition.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'ActivityDefinition.effectivePeriod', 'min'=>0, 'max'=>1},
      'topic' => {'type'=>'CodeableConcept', 'path'=>'ActivityDefinition.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/definition-topic', 'uri'=>nil}},
      'author' => {'type'=>'ContactDetail', 'path'=>'ActivityDefinition.author', 'min'=>0, 'max'=>Float::INFINITY},
      'editor' => {'type'=>'ContactDetail', 'path'=>'ActivityDefinition.editor', 'min'=>0, 'max'=>Float::INFINITY},
      'reviewer' => {'type'=>'ContactDetail', 'path'=>'ActivityDefinition.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
      'endorser' => {'type'=>'ContactDetail', 'path'=>'ActivityDefinition.endorser', 'min'=>0, 'max'=>Float::INFINITY},
      'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'ActivityDefinition.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
      'library' => {'type'=>'canonical', 'path'=>'ActivityDefinition.library', 'min'=>0, 'max'=>Float::INFINITY},
      'kind' => {'type'=>'code', 'path'=>'ActivityDefinition.kind', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-resource-types|4.0.0', 'uri'=>nil}},
      'profile' => {'type'=>'canonical', 'path'=>'ActivityDefinition.profile', 'min'=>0, 'max'=>1},
      'code' => {'type'=>'CodeableConcept', 'path'=>'ActivityDefinition.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-code', 'uri'=>nil}},
      'intent' => {'type'=>'code', 'path'=>'ActivityDefinition.intent', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-intent|4.0.0', 'uri'=>nil}},
      'priority' => {'type'=>'code', 'path'=>'ActivityDefinition.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-priority|4.0.0', 'uri'=>nil}},
      'doNotPerform' => {'type'=>'boolean', 'path'=>'ActivityDefinition.doNotPerform', 'min'=>0, 'max'=>1},
      'timingTiming' => {'type'=>'Timing', 'path'=>'ActivityDefinition.timing[x]', 'min'=>0, 'max'=>1},
      'timingDateTime' => {'type'=>'dateTime', 'path'=>'ActivityDefinition.timing[x]', 'min'=>0, 'max'=>1},
      'timingAge' => {'type'=>'Age', 'path'=>'ActivityDefinition.timing[x]', 'min'=>0, 'max'=>1},
      'timingPeriod' => {'type'=>'Period', 'path'=>'ActivityDefinition.timing[x]', 'min'=>0, 'max'=>1},
      'timingRange' => {'type'=>'Range', 'path'=>'ActivityDefinition.timing[x]', 'min'=>0, 'max'=>1},
      'timingDuration' => {'type'=>'Duration', 'path'=>'ActivityDefinition.timing[x]', 'min'=>0, 'max'=>1},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'ActivityDefinition.location', 'min'=>0, 'max'=>1},
      'participant' => {'type'=>'ActivityDefinition::Participant', 'path'=>'ActivityDefinition.participant', 'min'=>0, 'max'=>Float::INFINITY},
      'productReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'ActivityDefinition.product[x]', 'min'=>0, 'max'=>1},
      'productCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ActivityDefinition.product[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-codes', 'uri'=>nil}},
      'quantity' => {'type'=>'Quantity', 'path'=>'ActivityDefinition.quantity', 'min'=>0, 'max'=>1},
      'dosage' => {'type'=>'Dosage', 'path'=>'ActivityDefinition.dosage', 'min'=>0, 'max'=>Float::INFINITY},
      'bodySite' => {'type'=>'CodeableConcept', 'path'=>'ActivityDefinition.bodySite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'specimenRequirement' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/SpecimenDefinition'], 'type'=>'Reference', 'path'=>'ActivityDefinition.specimenRequirement', 'min'=>0, 'max'=>Float::INFINITY},
      'observationRequirement' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ObservationDefinition'], 'type'=>'Reference', 'path'=>'ActivityDefinition.observationRequirement', 'min'=>0, 'max'=>Float::INFINITY},
      'observationResultRequirement' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ObservationDefinition'], 'type'=>'Reference', 'path'=>'ActivityDefinition.observationResultRequirement', 'min'=>0, 'max'=>Float::INFINITY},
      'transform' => {'type'=>'canonical', 'path'=>'ActivityDefinition.transform', 'min'=>0, 'max'=>1},
      'dynamicValue' => {'type'=>'ActivityDefinition::DynamicValue', 'path'=>'ActivityDefinition.dynamicValue', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Participant < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Participant.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Participant.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Participant.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'code', 'path'=>'Participant.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-participant-type|4.0.0', 'uri'=>nil}},
        'role' => {'type'=>'CodeableConcept', 'path'=>'Participant.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-participant-role', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :role              # 0-1 CodeableConcept
    end

    class DynamicValue < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DynamicValue.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DynamicValue.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DynamicValue.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'path' => {'type'=>'string', 'path'=>'DynamicValue.path', 'min'=>1, 'max'=>1},
        'expression' => {'type'=>'Expression', 'path'=>'DynamicValue.expression', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :path              # 1-1 string
      attr_accessor :expression        # 1-1 Expression
    end

    attr_accessor :id                           # 0-1 id
    attr_accessor :meta                         # 0-1 Meta
    attr_accessor :implicitRules                # 0-1 uri
    attr_accessor :language                     # 0-1 code
    attr_accessor :text                         # 0-1 Narrative
    attr_accessor :contained                    # 0-* [ Resource ]
    attr_accessor :extension                    # 0-* [ Extension ]
    attr_accessor :modifierExtension            # 0-* [ Extension ]
    attr_accessor :url                          # 0-1 uri
    attr_accessor :identifier                   # 0-* [ Identifier ]
    attr_accessor :version                      # 0-1 string
    attr_accessor :name                         # 0-1 string
    attr_accessor :title                        # 0-1 string
    attr_accessor :subtitle                     # 0-1 string
    attr_accessor :status                       # 1-1 code
    attr_accessor :experimental                 # 0-1 boolean
    attr_accessor :subjectCodeableConcept       # 0-1 CodeableConcept
    attr_accessor :subjectReference             # 0-1 Reference(Group)
    attr_accessor :date                         # 0-1 dateTime
    attr_accessor :publisher                    # 0-1 string
    attr_accessor :contact                      # 0-* [ ContactDetail ]
    attr_accessor :description                  # 0-1 markdown
    attr_accessor :useContext                   # 0-* [ UsageContext ]
    attr_accessor :jurisdiction                 # 0-* [ CodeableConcept ]
    attr_accessor :purpose                      # 0-1 markdown
    attr_accessor :usage                        # 0-1 string
    attr_accessor :copyright                    # 0-1 markdown
    attr_accessor :approvalDate                 # 0-1 date
    attr_accessor :lastReviewDate               # 0-1 date
    attr_accessor :effectivePeriod              # 0-1 Period
    attr_accessor :topic                        # 0-* [ CodeableConcept ]
    attr_accessor :author                       # 0-* [ ContactDetail ]
    attr_accessor :editor                       # 0-* [ ContactDetail ]
    attr_accessor :reviewer                     # 0-* [ ContactDetail ]
    attr_accessor :endorser                     # 0-* [ ContactDetail ]
    attr_accessor :relatedArtifact              # 0-* [ RelatedArtifact ]
    attr_accessor :library                      # 0-* [ canonical ]
    attr_accessor :kind                         # 0-1 code
    attr_accessor :profile                      # 0-1 canonical
    attr_accessor :code                         # 0-1 CodeableConcept
    attr_accessor :intent                       # 0-1 code
    attr_accessor :priority                     # 0-1 code
    attr_accessor :doNotPerform                 # 0-1 boolean
    attr_accessor :timingTiming                 # 0-1 Timing
    attr_accessor :timingDateTime               # 0-1 dateTime
    attr_accessor :timingAge                    # 0-1 Age
    attr_accessor :timingPeriod                 # 0-1 Period
    attr_accessor :timingRange                  # 0-1 Range
    attr_accessor :timingDuration               # 0-1 Duration
    attr_accessor :location                     # 0-1 Reference(Location)
    attr_accessor :participant                  # 0-* [ ActivityDefinition::Participant ]
    attr_accessor :productReference             # 0-1 Reference(Medication|Substance)
    attr_accessor :productCodeableConcept       # 0-1 CodeableConcept
    attr_accessor :quantity                     # 0-1 Quantity
    attr_accessor :dosage                       # 0-* [ Dosage ]
    attr_accessor :bodySite                     # 0-* [ CodeableConcept ]
    attr_accessor :specimenRequirement          # 0-* [ Reference(SpecimenDefinition) ]
    attr_accessor :observationRequirement       # 0-* [ Reference(ObservationDefinition) ]
    attr_accessor :observationResultRequirement # 0-* [ Reference(ObservationDefinition) ]
    attr_accessor :transform                    # 0-1 canonical
    attr_accessor :dynamicValue                 # 0-* [ ActivityDefinition::DynamicValue ]

    def resourceType
      'ActivityDefinition'
    end
  end
end