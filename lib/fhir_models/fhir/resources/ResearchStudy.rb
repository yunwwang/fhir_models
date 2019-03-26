module FHIR
  class ResearchStudy < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['category', 'date', 'focus', 'identifier', 'keyword', 'location', 'partof', 'principalinvestigator', 'protocol', 'site', 'sponsor', 'status', 'title']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ResearchStudy.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ResearchStudy.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ResearchStudy.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ResearchStudy.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ResearchStudy.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ResearchStudy.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ResearchStudy.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ResearchStudy.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ResearchStudy.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'title' => {'type'=>'string', 'path'=>'ResearchStudy.title', 'min'=>0, 'max'=>1},
      'protocol' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/PlanDefinition'], 'type'=>'Reference', 'path'=>'ResearchStudy.protocol', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ResearchStudy'], 'type'=>'Reference', 'path'=>'ResearchStudy.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'ResearchStudy.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/research-study-status|4.0.0', 'uri'=>nil}},
      'primaryPurposeType' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.primaryPurposeType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/research-study-prim-purp-type', 'uri'=>nil}},
      'phase' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.phase', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/research-study-phase', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'focus' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.focus', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'condition' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.condition', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
      'contact' => {'type'=>'ContactDetail', 'path'=>'ResearchStudy.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'ResearchStudy.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
      'keyword' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.keyword', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'location' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.location', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/jurisdiction', 'uri'=>nil}},
      'description' => {'type'=>'markdown', 'path'=>'ResearchStudy.description', 'min'=>0, 'max'=>1},
      'enrollment' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'ResearchStudy.enrollment', 'min'=>0, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'ResearchStudy.period', 'min'=>0, 'max'=>1},
      'sponsor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ResearchStudy.sponsor', 'min'=>0, 'max'=>1},
      'principalInvestigator' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'ResearchStudy.principalInvestigator', 'min'=>0, 'max'=>1},
      'site' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'ResearchStudy.site', 'min'=>0, 'max'=>Float::INFINITY},
      'reasonStopped' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.reasonStopped', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/research-study-reason-stopped', 'uri'=>nil}},
      'note' => {'type'=>'Annotation', 'path'=>'ResearchStudy.note', 'min'=>0, 'max'=>Float::INFINITY},
      'arm' => {'type'=>'ResearchStudy::Arm', 'path'=>'ResearchStudy.arm', 'min'=>0, 'max'=>Float::INFINITY},
      'objective' => {'type'=>'ResearchStudy::Objective', 'path'=>'ResearchStudy.objective', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Arm < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Arm.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Arm.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Arm.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Arm.name', 'min'=>1, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Arm.type', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Arm.description', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 string
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :description       # 0-1 string
    end

    class Objective < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Objective.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Objective.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Objective.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Objective.name', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Objective.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/research-study-objective-type', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :type              # 0-1 CodeableConcept
    end

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :identifier            # 0-* [ Identifier ]
    attr_accessor :title                 # 0-1 string
    attr_accessor :protocol              # 0-* [ Reference(PlanDefinition) ]
    attr_accessor :partOf                # 0-* [ Reference(ResearchStudy) ]
    attr_accessor :status                # 1-1 code
    attr_accessor :primaryPurposeType    # 0-1 CodeableConcept
    attr_accessor :phase                 # 0-1 CodeableConcept
    attr_accessor :category              # 0-* [ CodeableConcept ]
    attr_accessor :focus                 # 0-* [ CodeableConcept ]
    attr_accessor :condition             # 0-* [ CodeableConcept ]
    attr_accessor :contact               # 0-* [ ContactDetail ]
    attr_accessor :relatedArtifact       # 0-* [ RelatedArtifact ]
    attr_accessor :keyword               # 0-* [ CodeableConcept ]
    attr_accessor :location              # 0-* [ CodeableConcept ]
    attr_accessor :description           # 0-1 markdown
    attr_accessor :enrollment            # 0-* [ Reference(Group) ]
    attr_accessor :period                # 0-1 Period
    attr_accessor :sponsor               # 0-1 Reference(Organization)
    attr_accessor :principalInvestigator # 0-1 Reference(Practitioner|PractitionerRole)
    attr_accessor :site                  # 0-* [ Reference(Location) ]
    attr_accessor :reasonStopped         # 0-1 CodeableConcept
    attr_accessor :note                  # 0-* [ Annotation ]
    attr_accessor :arm                   # 0-* [ ResearchStudy::Arm ]
    attr_accessor :objective             # 0-* [ ResearchStudy::Objective ]

    def resourceType
      'ResearchStudy'
    end
  end
end