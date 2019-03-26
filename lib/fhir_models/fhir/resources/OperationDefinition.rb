module FHIR
  class OperationDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'date', 'description', 'jurisdiction', 'name', 'publisher', 'status', 'title', 'url', 'version', 'base', 'code', 'input-profile', 'instance', 'kind', 'output-profile', 'system', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'OperationDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'OperationDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'OperationDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'OperationDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'OperationDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'OperationDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'OperationDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'OperationDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'OperationDefinition.url', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'OperationDefinition.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'OperationDefinition.name', 'min'=>1, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'OperationDefinition.title', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'OperationDefinition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/publication-status|4.0.0', 'uri'=>nil}},
      'kind' => {'type'=>'code', 'path'=>'OperationDefinition.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/operation-kind|4.0.0', 'uri'=>nil}},
      'experimental' => {'type'=>'boolean', 'path'=>'OperationDefinition.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'OperationDefinition.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'OperationDefinition.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'OperationDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'OperationDefinition.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'OperationDefinition.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'type'=>'CodeableConcept', 'path'=>'OperationDefinition.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/jurisdiction', 'uri'=>nil}},
      'purpose' => {'type'=>'markdown', 'path'=>'OperationDefinition.purpose', 'min'=>0, 'max'=>1},
      'affectsState' => {'type'=>'boolean', 'path'=>'OperationDefinition.affectsState', 'min'=>0, 'max'=>1},
      'code' => {'type'=>'code', 'path'=>'OperationDefinition.code', 'min'=>1, 'max'=>1},
      'comment' => {'type'=>'markdown', 'path'=>'OperationDefinition.comment', 'min'=>0, 'max'=>1},
      'base' => {'type'=>'canonical', 'path'=>'OperationDefinition.base', 'min'=>0, 'max'=>1},
      'resource' => {'type'=>'code', 'path'=>'OperationDefinition.resource', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/resource-types|4.0.0', 'uri'=>nil}},
      'system' => {'type'=>'boolean', 'path'=>'OperationDefinition.system', 'min'=>1, 'max'=>1},
      'type' => {'type'=>'boolean', 'path'=>'OperationDefinition.type', 'min'=>1, 'max'=>1},
      'instance' => {'type'=>'boolean', 'path'=>'OperationDefinition.instance', 'min'=>1, 'max'=>1},
      'inputProfile' => {'type'=>'canonical', 'path'=>'OperationDefinition.inputProfile', 'min'=>0, 'max'=>1},
      'outputProfile' => {'type'=>'canonical', 'path'=>'OperationDefinition.outputProfile', 'min'=>0, 'max'=>1},
      'parameter' => {'type'=>'OperationDefinition::Parameter', 'path'=>'OperationDefinition.parameter', 'min'=>0, 'max'=>Float::INFINITY},
      'overload' => {'type'=>'OperationDefinition::Overload', 'path'=>'OperationDefinition.overload', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Parameter < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'code', 'path'=>'Parameter.name', 'min'=>1, 'max'=>1},
        'use' => {'type'=>'code', 'path'=>'Parameter.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/operation-parameter-use|4.0.0', 'uri'=>nil}},
        'min' => {'type'=>'integer', 'path'=>'Parameter.min', 'min'=>1, 'max'=>1},
        'max' => {'type'=>'string', 'path'=>'Parameter.max', 'min'=>1, 'max'=>1},
        'documentation' => {'type'=>'string', 'path'=>'Parameter.documentation', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'code', 'path'=>'Parameter.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/all-types|4.0.0', 'uri'=>nil}},
        'targetProfile' => {'type'=>'canonical', 'path'=>'Parameter.targetProfile', 'min'=>0, 'max'=>Float::INFINITY},
        'searchType' => {'type'=>'code', 'path'=>'Parameter.searchType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/search-param-type|4.0.0', 'uri'=>nil}},
        'binding' => {'type'=>'OperationDefinition::Parameter::Binding', 'path'=>'Parameter.binding', 'min'=>0, 'max'=>1},
        'referencedFrom' => {'type'=>'OperationDefinition::Parameter::ReferencedFrom', 'path'=>'Parameter.referencedFrom', 'min'=>0, 'max'=>Float::INFINITY},
        'part' => {'type'=>'OperationDefinition::Parameter', 'path'=>'Parameter.part', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Binding < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Binding.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Binding.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Binding.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'strength' => {'type'=>'code', 'path'=>'Binding.strength', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/binding-strength|4.0.0', 'uri'=>nil}},
          'valueSet' => {'type'=>'canonical', 'path'=>'Binding.valueSet', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :strength          # 1-1 code
        attr_accessor :valueSet          # 1-1 canonical
      end

      class ReferencedFrom < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ReferencedFrom.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ReferencedFrom.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ReferencedFrom.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'source' => {'type'=>'string', 'path'=>'ReferencedFrom.source', 'min'=>1, 'max'=>1},
          'sourceId' => {'type'=>'string', 'path'=>'ReferencedFrom.sourceId', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :source            # 1-1 string
        attr_accessor :sourceId          # 0-1 string
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 code
      attr_accessor :use               # 1-1 code
      attr_accessor :min               # 1-1 integer
      attr_accessor :max               # 1-1 string
      attr_accessor :documentation     # 0-1 string
      attr_accessor :type              # 0-1 code
      attr_accessor :targetProfile     # 0-* [ canonical ]
      attr_accessor :searchType        # 0-1 code
      attr_accessor :binding           # 0-1 OperationDefinition::Parameter::Binding
      attr_accessor :referencedFrom    # 0-* [ OperationDefinition::Parameter::ReferencedFrom ]
      attr_accessor :part              # 0-* [ OperationDefinition::Parameter ]
    end

    class Overload < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Overload.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Overload.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Overload.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'parameterName' => {'type'=>'string', 'path'=>'Overload.parameterName', 'min'=>0, 'max'=>Float::INFINITY},
        'comment' => {'type'=>'string', 'path'=>'Overload.comment', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :parameterName     # 0-* [ string ]
      attr_accessor :comment           # 0-1 string
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :url               # 0-1 uri
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 1-1 string
    attr_accessor :title             # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :kind              # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ ContactDetail ]
    attr_accessor :description       # 0-1 markdown
    attr_accessor :useContext        # 0-* [ UsageContext ]
    attr_accessor :jurisdiction      # 0-* [ CodeableConcept ]
    attr_accessor :purpose           # 0-1 markdown
    attr_accessor :affectsState      # 0-1 boolean
    attr_accessor :code              # 1-1 code
    attr_accessor :comment           # 0-1 markdown
    attr_accessor :base              # 0-1 canonical
    attr_accessor :resource          # 0-* [ code ]
    attr_accessor :system            # 1-1 boolean
    attr_accessor :type              # 1-1 boolean
    attr_accessor :instance          # 1-1 boolean
    attr_accessor :inputProfile      # 0-1 canonical
    attr_accessor :outputProfile     # 0-1 canonical
    attr_accessor :parameter         # 0-* [ OperationDefinition::Parameter ]
    attr_accessor :overload          # 0-* [ OperationDefinition::Overload ]

    def resourceType
      'OperationDefinition'
    end
  end
end