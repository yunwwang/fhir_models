module FHIR
  class RiskEvidenceSynthesis < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'date', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'title', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'RiskEvidenceSynthesis.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'RiskEvidenceSynthesis.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'RiskEvidenceSynthesis.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'RiskEvidenceSynthesis.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'RiskEvidenceSynthesis.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'RiskEvidenceSynthesis.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'RiskEvidenceSynthesis.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'RiskEvidenceSynthesis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'RiskEvidenceSynthesis.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'RiskEvidenceSynthesis.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'RiskEvidenceSynthesis.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'RiskEvidenceSynthesis.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'RiskEvidenceSynthesis.title', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'RiskEvidenceSynthesis.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/publication-status|4.0.0', 'uri'=>nil}},
      'date' => {'type'=>'dateTime', 'path'=>'RiskEvidenceSynthesis.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'RiskEvidenceSynthesis.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'RiskEvidenceSynthesis.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'RiskEvidenceSynthesis.description', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'RiskEvidenceSynthesis.note', 'min'=>0, 'max'=>Float::INFINITY},
      'useContext' => {'type'=>'UsageContext', 'path'=>'RiskEvidenceSynthesis.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'type'=>'CodeableConcept', 'path'=>'RiskEvidenceSynthesis.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/jurisdiction', 'uri'=>nil}},
      'copyright' => {'type'=>'markdown', 'path'=>'RiskEvidenceSynthesis.copyright', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'RiskEvidenceSynthesis.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'RiskEvidenceSynthesis.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'RiskEvidenceSynthesis.effectivePeriod', 'min'=>0, 'max'=>1},
      'topic' => {'type'=>'CodeableConcept', 'path'=>'RiskEvidenceSynthesis.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/definition-topic', 'uri'=>nil}},
      'author' => {'type'=>'ContactDetail', 'path'=>'RiskEvidenceSynthesis.author', 'min'=>0, 'max'=>Float::INFINITY},
      'editor' => {'type'=>'ContactDetail', 'path'=>'RiskEvidenceSynthesis.editor', 'min'=>0, 'max'=>Float::INFINITY},
      'reviewer' => {'type'=>'ContactDetail', 'path'=>'RiskEvidenceSynthesis.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
      'endorser' => {'type'=>'ContactDetail', 'path'=>'RiskEvidenceSynthesis.endorser', 'min'=>0, 'max'=>Float::INFINITY},
      'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'RiskEvidenceSynthesis.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
      'synthesisType' => {'type'=>'CodeableConcept', 'path'=>'RiskEvidenceSynthesis.synthesisType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/synthesis-type', 'uri'=>nil}},
      'studyType' => {'type'=>'CodeableConcept', 'path'=>'RiskEvidenceSynthesis.studyType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/study-type', 'uri'=>nil}},
      'population' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'RiskEvidenceSynthesis.population', 'min'=>1, 'max'=>1},
      'exposure' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'RiskEvidenceSynthesis.exposure', 'min'=>0, 'max'=>1},
      'outcome' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'RiskEvidenceSynthesis.outcome', 'min'=>1, 'max'=>1},
      'sampleSize' => {'type'=>'RiskEvidenceSynthesis::SampleSize', 'path'=>'RiskEvidenceSynthesis.sampleSize', 'min'=>0, 'max'=>1},
      'riskEstimate' => {'type'=>'RiskEvidenceSynthesis::RiskEstimate', 'path'=>'RiskEvidenceSynthesis.riskEstimate', 'min'=>0, 'max'=>1},
      'certainty' => {'type'=>'RiskEvidenceSynthesis::Certainty', 'path'=>'RiskEvidenceSynthesis.certainty', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class SampleSize < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'SampleSize.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'SampleSize.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SampleSize.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'SampleSize.description', 'min'=>0, 'max'=>1},
        'numberOfStudies' => {'type'=>'integer', 'path'=>'SampleSize.numberOfStudies', 'min'=>0, 'max'=>1},
        'numberOfParticipants' => {'type'=>'integer', 'path'=>'SampleSize.numberOfParticipants', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :description          # 0-1 string
      attr_accessor :numberOfStudies      # 0-1 integer
      attr_accessor :numberOfParticipants # 0-1 integer
    end

    class RiskEstimate < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'RiskEstimate.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'RiskEstimate.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'RiskEstimate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'RiskEstimate.description', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'RiskEstimate.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/risk-estimate-type', 'uri'=>nil}},
        'value' => {'type'=>'decimal', 'path'=>'RiskEstimate.value', 'min'=>0, 'max'=>1},
        'unitOfMeasure' => {'type'=>'CodeableConcept', 'path'=>'RiskEstimate.unitOfMeasure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ucum-units|4.0.0', 'uri'=>nil}},
        'denominatorCount' => {'type'=>'integer', 'path'=>'RiskEstimate.denominatorCount', 'min'=>0, 'max'=>1},
        'numeratorCount' => {'type'=>'integer', 'path'=>'RiskEstimate.numeratorCount', 'min'=>0, 'max'=>1},
        'precisionEstimate' => {'type'=>'RiskEvidenceSynthesis::RiskEstimate::PrecisionEstimate', 'path'=>'RiskEstimate.precisionEstimate', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class PrecisionEstimate < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'PrecisionEstimate.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'PrecisionEstimate.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'PrecisionEstimate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'PrecisionEstimate.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/precision-estimate-type', 'uri'=>nil}},
          'level' => {'type'=>'decimal', 'path'=>'PrecisionEstimate.level', 'min'=>0, 'max'=>1},
          'from' => {'type'=>'decimal', 'path'=>'PrecisionEstimate.from', 'min'=>0, 'max'=>1},
          'to' => {'type'=>'decimal', 'path'=>'PrecisionEstimate.to', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :level             # 0-1 decimal
        attr_accessor :from              # 0-1 decimal
        attr_accessor :to                # 0-1 decimal
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :description       # 0-1 string
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :value             # 0-1 decimal
      attr_accessor :unitOfMeasure     # 0-1 CodeableConcept
      attr_accessor :denominatorCount  # 0-1 integer
      attr_accessor :numeratorCount    # 0-1 integer
      attr_accessor :precisionEstimate # 0-* [ RiskEvidenceSynthesis::RiskEstimate::PrecisionEstimate ]
    end

    class Certainty < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Certainty.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Certainty.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Certainty.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'rating' => {'type'=>'CodeableConcept', 'path'=>'Certainty.rating', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/evidence-quality', 'uri'=>nil}},
        'note' => {'type'=>'Annotation', 'path'=>'Certainty.note', 'min'=>0, 'max'=>Float::INFINITY},
        'certaintySubcomponent' => {'type'=>'RiskEvidenceSynthesis::Certainty::CertaintySubcomponent', 'path'=>'Certainty.certaintySubcomponent', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class CertaintySubcomponent < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'CertaintySubcomponent.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'CertaintySubcomponent.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'CertaintySubcomponent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'CertaintySubcomponent.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/certainty-subcomponent-type', 'uri'=>nil}},
          'rating' => {'type'=>'CodeableConcept', 'path'=>'CertaintySubcomponent.rating', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/certainty-subcomponent-rating', 'uri'=>nil}},
          'note' => {'type'=>'Annotation', 'path'=>'CertaintySubcomponent.note', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :rating            # 0-* [ CodeableConcept ]
        attr_accessor :note              # 0-* [ Annotation ]
      end

      attr_accessor :id                    # 0-1 string
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :rating                # 0-* [ CodeableConcept ]
      attr_accessor :note                  # 0-* [ Annotation ]
      attr_accessor :certaintySubcomponent # 0-* [ RiskEvidenceSynthesis::Certainty::CertaintySubcomponent ]
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
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 0-1 string
    attr_accessor :title             # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ ContactDetail ]
    attr_accessor :description       # 0-1 markdown
    attr_accessor :note              # 0-* [ Annotation ]
    attr_accessor :useContext        # 0-* [ UsageContext ]
    attr_accessor :jurisdiction      # 0-* [ CodeableConcept ]
    attr_accessor :copyright         # 0-1 markdown
    attr_accessor :approvalDate      # 0-1 date
    attr_accessor :lastReviewDate    # 0-1 date
    attr_accessor :effectivePeriod   # 0-1 Period
    attr_accessor :topic             # 0-* [ CodeableConcept ]
    attr_accessor :author            # 0-* [ ContactDetail ]
    attr_accessor :editor            # 0-* [ ContactDetail ]
    attr_accessor :reviewer          # 0-* [ ContactDetail ]
    attr_accessor :endorser          # 0-* [ ContactDetail ]
    attr_accessor :relatedArtifact   # 0-* [ RelatedArtifact ]
    attr_accessor :synthesisType     # 0-1 CodeableConcept
    attr_accessor :studyType         # 0-1 CodeableConcept
    attr_accessor :population        # 1-1 Reference(EvidenceVariable)
    attr_accessor :exposure          # 0-1 Reference(EvidenceVariable)
    attr_accessor :outcome           # 1-1 Reference(EvidenceVariable)
    attr_accessor :sampleSize        # 0-1 RiskEvidenceSynthesis::SampleSize
    attr_accessor :riskEstimate      # 0-1 RiskEvidenceSynthesis::RiskEstimate
    attr_accessor :certainty         # 0-* [ RiskEvidenceSynthesis::Certainty ]

    def resourceType
      'RiskEvidenceSynthesis'
    end
  end
end