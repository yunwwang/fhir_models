module FHIR
  class PlanDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'subject' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['composed-of', 'context', 'context-quantity', 'context-type', 'date', 'definition', 'depends-on', 'derived-from', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'predecessor', 'publisher', 'status', 'successor', 'title', 'topic', 'type', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'PlanDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'PlanDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'PlanDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'PlanDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'PlanDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'PlanDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'PlanDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'PlanDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'PlanDefinition.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'PlanDefinition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'PlanDefinition.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'PlanDefinition.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'PlanDefinition.title', 'min'=>0, 'max'=>1},
      'subtitle' => {'type'=>'string', 'path'=>'PlanDefinition.subtitle', 'min'=>0, 'max'=>1},
      'type' => {'type'=>'CodeableConcept', 'path'=>'PlanDefinition.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/plan-definition-type', 'uri'=>nil}},
      'status' => {'type'=>'code', 'path'=>'PlanDefinition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/publication-status|4.0.0', 'uri'=>nil}},
      'experimental' => {'type'=>'boolean', 'path'=>'PlanDefinition.experimental', 'min'=>0, 'max'=>1},
      'subjectCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'PlanDefinition.subject[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/subject-type', 'uri'=>nil}},
      'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'PlanDefinition.subject[x]', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'PlanDefinition.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'PlanDefinition.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'PlanDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'PlanDefinition.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'PlanDefinition.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'type'=>'CodeableConcept', 'path'=>'PlanDefinition.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/jurisdiction', 'uri'=>nil}},
      'purpose' => {'type'=>'markdown', 'path'=>'PlanDefinition.purpose', 'min'=>0, 'max'=>1},
      'usage' => {'type'=>'string', 'path'=>'PlanDefinition.usage', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'markdown', 'path'=>'PlanDefinition.copyright', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'PlanDefinition.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'PlanDefinition.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'PlanDefinition.effectivePeriod', 'min'=>0, 'max'=>1},
      'topic' => {'type'=>'CodeableConcept', 'path'=>'PlanDefinition.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/definition-topic', 'uri'=>nil}},
      'author' => {'type'=>'ContactDetail', 'path'=>'PlanDefinition.author', 'min'=>0, 'max'=>Float::INFINITY},
      'editor' => {'type'=>'ContactDetail', 'path'=>'PlanDefinition.editor', 'min'=>0, 'max'=>Float::INFINITY},
      'reviewer' => {'type'=>'ContactDetail', 'path'=>'PlanDefinition.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
      'endorser' => {'type'=>'ContactDetail', 'path'=>'PlanDefinition.endorser', 'min'=>0, 'max'=>Float::INFINITY},
      'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'PlanDefinition.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
      'library' => {'type'=>'canonical', 'path'=>'PlanDefinition.library', 'min'=>0, 'max'=>Float::INFINITY},
      'goal' => {'type'=>'PlanDefinition::Goal', 'path'=>'PlanDefinition.goal', 'min'=>0, 'max'=>Float::INFINITY},
      'action' => {'type'=>'PlanDefinition::Action', 'path'=>'PlanDefinition.action', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Goal < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Goal.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Goal.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Goal.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'category' => {'type'=>'CodeableConcept', 'path'=>'Goal.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/goal-category', 'uri'=>nil}},
        'description' => {'type'=>'CodeableConcept', 'path'=>'Goal.description', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinical-findings', 'uri'=>nil}},
        'priority' => {'type'=>'CodeableConcept', 'path'=>'Goal.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/goal-priority', 'uri'=>nil}},
        'start' => {'type'=>'CodeableConcept', 'path'=>'Goal.start', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/goal-start-event', 'uri'=>nil}},
        'addresses' => {'type'=>'CodeableConcept', 'path'=>'Goal.addresses', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
        'documentation' => {'type'=>'RelatedArtifact', 'path'=>'Goal.documentation', 'min'=>0, 'max'=>Float::INFINITY},
        'target' => {'type'=>'PlanDefinition::Goal::Target', 'path'=>'Goal.target', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Target < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'detail' => ['Quantity', 'Range', 'CodeableConcept']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'measure' => {'type'=>'CodeableConcept', 'path'=>'Target.measure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-codes', 'uri'=>nil}},
          'detailQuantity' => {'type'=>'Quantity', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'detailRange' => {'type'=>'Range', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'detailCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'due' => {'type'=>'Duration', 'path'=>'Target.due', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                    # 0-1 string
        attr_accessor :extension             # 0-* [ Extension ]
        attr_accessor :modifierExtension     # 0-* [ Extension ]
        attr_accessor :measure               # 0-1 CodeableConcept
        attr_accessor :detailQuantity        # 0-1 Quantity
        attr_accessor :detailRange           # 0-1 Range
        attr_accessor :detailCodeableConcept # 0-1 CodeableConcept
        attr_accessor :due                   # 0-1 Duration
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :category          # 0-1 CodeableConcept
      attr_accessor :description       # 1-1 CodeableConcept
      attr_accessor :priority          # 0-1 CodeableConcept
      attr_accessor :start             # 0-1 CodeableConcept
      attr_accessor :addresses         # 0-* [ CodeableConcept ]
      attr_accessor :documentation     # 0-* [ RelatedArtifact ]
      attr_accessor :target            # 0-* [ PlanDefinition::Goal::Target ]
    end

    class Action < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'subject' => ['CodeableConcept', 'Reference'],
        'timing' => ['dateTime', 'Age', 'Period', 'Duration', 'Range', 'Timing'],
        'definition' => ['canonical', 'uri']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'prefix' => {'type'=>'string', 'path'=>'Action.prefix', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'Action.title', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Action.description', 'min'=>0, 'max'=>1},
        'textEquivalent' => {'type'=>'string', 'path'=>'Action.textEquivalent', 'min'=>0, 'max'=>1},
        'priority' => {'type'=>'code', 'path'=>'Action.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/request-priority|4.0.0', 'uri'=>nil}},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Action.code', 'min'=>0, 'max'=>Float::INFINITY},
        'reason' => {'type'=>'CodeableConcept', 'path'=>'Action.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'documentation' => {'type'=>'RelatedArtifact', 'path'=>'Action.documentation', 'min'=>0, 'max'=>Float::INFINITY},
        'goalId' => {'type'=>'id', 'path'=>'Action.goalId', 'min'=>0, 'max'=>Float::INFINITY},
        'subjectCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Action.subject[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/subject-type', 'uri'=>nil}},
        'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Action.subject[x]', 'min'=>0, 'max'=>1},
        'trigger' => {'type'=>'TriggerDefinition', 'path'=>'Action.trigger', 'min'=>0, 'max'=>Float::INFINITY},
        'condition' => {'type'=>'PlanDefinition::Action::Condition', 'path'=>'Action.condition', 'min'=>0, 'max'=>Float::INFINITY},
        'input' => {'type'=>'DataRequirement', 'path'=>'Action.input', 'min'=>0, 'max'=>Float::INFINITY},
        'output' => {'type'=>'DataRequirement', 'path'=>'Action.output', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedAction' => {'type'=>'PlanDefinition::Action::RelatedAction', 'path'=>'Action.relatedAction', 'min'=>0, 'max'=>Float::INFINITY},
        'timingDateTime' => {'type'=>'dateTime', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingAge' => {'type'=>'Age', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingPeriod' => {'type'=>'Period', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingDuration' => {'type'=>'Duration', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingRange' => {'type'=>'Range', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingTiming' => {'type'=>'Timing', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'participant' => {'type'=>'PlanDefinition::Action::Participant', 'path'=>'Action.participant', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Action.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-type', 'uri'=>nil}},
        'groupingBehavior' => {'type'=>'code', 'path'=>'Action.groupingBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-grouping-behavior|4.0.0', 'uri'=>nil}},
        'selectionBehavior' => {'type'=>'code', 'path'=>'Action.selectionBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-selection-behavior|4.0.0', 'uri'=>nil}},
        'requiredBehavior' => {'type'=>'code', 'path'=>'Action.requiredBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-required-behavior|4.0.0', 'uri'=>nil}},
        'precheckBehavior' => {'type'=>'code', 'path'=>'Action.precheckBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-precheck-behavior|4.0.0', 'uri'=>nil}},
        'cardinalityBehavior' => {'type'=>'code', 'path'=>'Action.cardinalityBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-cardinality-behavior|4.0.0', 'uri'=>nil}},
        'definitionCanonical' => {'type'=>'canonical', 'path'=>'Action.definition[x]', 'min'=>0, 'max'=>1},
        'definitionUri' => {'type'=>'uri', 'path'=>'Action.definition[x]', 'min'=>0, 'max'=>1},
        'transform' => {'type'=>'canonical', 'path'=>'Action.transform', 'min'=>0, 'max'=>1},
        'dynamicValue' => {'type'=>'PlanDefinition::Action::DynamicValue', 'path'=>'Action.dynamicValue', 'min'=>0, 'max'=>Float::INFINITY},
        'action' => {'type'=>'PlanDefinition::Action', 'path'=>'Action.action', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Condition < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Condition.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Condition.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Condition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'kind' => {'type'=>'code', 'path'=>'Condition.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-condition-kind|4.0.0', 'uri'=>nil}},
          'expression' => {'type'=>'Expression', 'path'=>'Condition.expression', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :kind              # 1-1 code
        attr_accessor :expression        # 0-1 Expression
      end

      class RelatedAction < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'offset' => ['Duration', 'Range']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'RelatedAction.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'RelatedAction.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatedAction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'actionId' => {'type'=>'id', 'path'=>'RelatedAction.actionId', 'min'=>1, 'max'=>1},
          'relationship' => {'type'=>'code', 'path'=>'RelatedAction.relationship', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/action-relationship-type|4.0.0', 'uri'=>nil}},
          'offsetDuration' => {'type'=>'Duration', 'path'=>'RelatedAction.offset[x]', 'min'=>0, 'max'=>1},
          'offsetRange' => {'type'=>'Range', 'path'=>'RelatedAction.offset[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :actionId          # 1-1 id
        attr_accessor :relationship      # 1-1 code
        attr_accessor :offsetDuration    # 0-1 Duration
        attr_accessor :offsetRange       # 0-1 Range
      end

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
          'path' => {'type'=>'string', 'path'=>'DynamicValue.path', 'min'=>0, 'max'=>1},
          'expression' => {'type'=>'Expression', 'path'=>'DynamicValue.expression', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :path              # 0-1 string
        attr_accessor :expression        # 0-1 Expression
      end

      attr_accessor :id                     # 0-1 string
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :prefix                 # 0-1 string
      attr_accessor :title                  # 0-1 string
      attr_accessor :description            # 0-1 string
      attr_accessor :textEquivalent         # 0-1 string
      attr_accessor :priority               # 0-1 code
      attr_accessor :code                   # 0-* [ CodeableConcept ]
      attr_accessor :reason                 # 0-* [ CodeableConcept ]
      attr_accessor :documentation          # 0-* [ RelatedArtifact ]
      attr_accessor :goalId                 # 0-* [ id ]
      attr_accessor :subjectCodeableConcept # 0-1 CodeableConcept
      attr_accessor :subjectReference       # 0-1 Reference(Group)
      attr_accessor :trigger                # 0-* [ TriggerDefinition ]
      attr_accessor :condition              # 0-* [ PlanDefinition::Action::Condition ]
      attr_accessor :input                  # 0-* [ DataRequirement ]
      attr_accessor :output                 # 0-* [ DataRequirement ]
      attr_accessor :relatedAction          # 0-* [ PlanDefinition::Action::RelatedAction ]
      attr_accessor :timingDateTime         # 0-1 dateTime
      attr_accessor :timingAge              # 0-1 Age
      attr_accessor :timingPeriod           # 0-1 Period
      attr_accessor :timingDuration         # 0-1 Duration
      attr_accessor :timingRange            # 0-1 Range
      attr_accessor :timingTiming           # 0-1 Timing
      attr_accessor :participant            # 0-* [ PlanDefinition::Action::Participant ]
      attr_accessor :type                   # 0-1 CodeableConcept
      attr_accessor :groupingBehavior       # 0-1 code
      attr_accessor :selectionBehavior      # 0-1 code
      attr_accessor :requiredBehavior       # 0-1 code
      attr_accessor :precheckBehavior       # 0-1 code
      attr_accessor :cardinalityBehavior    # 0-1 code
      attr_accessor :definitionCanonical    # 0-1 canonical
      attr_accessor :definitionUri          # 0-1 uri
      attr_accessor :transform              # 0-1 canonical
      attr_accessor :dynamicValue           # 0-* [ PlanDefinition::Action::DynamicValue ]
      attr_accessor :action                 # 0-* [ PlanDefinition::Action ]
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :url                    # 0-1 uri
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :version                # 0-1 string
    attr_accessor :name                   # 0-1 string
    attr_accessor :title                  # 0-1 string
    attr_accessor :subtitle               # 0-1 string
    attr_accessor :type                   # 0-1 CodeableConcept
    attr_accessor :status                 # 1-1 code
    attr_accessor :experimental           # 0-1 boolean
    attr_accessor :subjectCodeableConcept # 0-1 CodeableConcept
    attr_accessor :subjectReference       # 0-1 Reference(Group)
    attr_accessor :date                   # 0-1 dateTime
    attr_accessor :publisher              # 0-1 string
    attr_accessor :contact                # 0-* [ ContactDetail ]
    attr_accessor :description            # 0-1 markdown
    attr_accessor :useContext             # 0-* [ UsageContext ]
    attr_accessor :jurisdiction           # 0-* [ CodeableConcept ]
    attr_accessor :purpose                # 0-1 markdown
    attr_accessor :usage                  # 0-1 string
    attr_accessor :copyright              # 0-1 markdown
    attr_accessor :approvalDate           # 0-1 date
    attr_accessor :lastReviewDate         # 0-1 date
    attr_accessor :effectivePeriod        # 0-1 Period
    attr_accessor :topic                  # 0-* [ CodeableConcept ]
    attr_accessor :author                 # 0-* [ ContactDetail ]
    attr_accessor :editor                 # 0-* [ ContactDetail ]
    attr_accessor :reviewer               # 0-* [ ContactDetail ]
    attr_accessor :endorser               # 0-* [ ContactDetail ]
    attr_accessor :relatedArtifact        # 0-* [ RelatedArtifact ]
    attr_accessor :library                # 0-* [ canonical ]
    attr_accessor :goal                   # 0-* [ PlanDefinition::Goal ]
    attr_accessor :action                 # 0-* [ PlanDefinition::Action ]

    def resourceType
      'PlanDefinition'
    end
  end
end