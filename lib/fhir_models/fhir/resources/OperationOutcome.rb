module FHIR
  class OperationOutcome < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = 
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'OperationOutcome.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'OperationOutcome.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'OperationOutcome.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'OperationOutcome.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'OperationOutcome.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'OperationOutcome.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'OperationOutcome.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'OperationOutcome.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'issue' => {'type'=>'OperationOutcome::Issue', 'path'=>'OperationOutcome.issue', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class Issue < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Issue.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Issue.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Issue.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'severity' => {'type'=>'code', 'path'=>'Issue.severity', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/issue-severity|4.0.0', 'uri'=>nil}},
        'code' => {'type'=>'code', 'path'=>'Issue.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/issue-type|4.0.0', 'uri'=>nil}},
        'details' => {'type'=>'CodeableConcept', 'path'=>'Issue.details', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/operation-outcome', 'uri'=>nil}},
        'diagnostics' => {'type'=>'string', 'path'=>'Issue.diagnostics', 'min'=>0, 'max'=>1},
        'location' => {'type'=>'string', 'path'=>'Issue.location', 'min'=>0, 'max'=>Float::INFINITY},
        'expression' => {'type'=>'string', 'path'=>'Issue.expression', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :severity          # 1-1 code
      attr_accessor :code              # 1-1 code
      attr_accessor :details           # 0-1 CodeableConcept
      attr_accessor :diagnostics       # 0-1 string
      attr_accessor :location          # 0-* [ string ]
      attr_accessor :expression        # 0-* [ string ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :issue             # 1-* [ OperationOutcome::Issue ]

    def resourceType
      'OperationOutcome'
    end
  end
end