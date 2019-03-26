module FHIR
  class FamilyMemberHistory < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'born' => ['Period', 'date', 'string'],
      'age' => ['Age', 'Range', 'string'],
      'deceased' => ['boolean', 'Age', 'Range', 'date', 'string']
    }
    SEARCH_PARAMS = ['code', 'date', 'identifier', 'patient', 'instantiates-canonical', 'instantiates-uri', 'relationship', 'sex', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'FamilyMemberHistory.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'FamilyMemberHistory.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'FamilyMemberHistory.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'FamilyMemberHistory.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'FamilyMemberHistory.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'FamilyMemberHistory.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'FamilyMemberHistory.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'FamilyMemberHistory.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'FamilyMemberHistory.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'FamilyMemberHistory.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesUri' => {'type'=>'uri', 'path'=>'FamilyMemberHistory.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'FamilyMemberHistory.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/history-status|4.0.0', 'uri'=>nil}},
      'dataAbsentReason' => {'type'=>'CodeableConcept', 'path'=>'FamilyMemberHistory.dataAbsentReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/history-absent-reason', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'FamilyMemberHistory.patient', 'min'=>1, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'FamilyMemberHistory.date', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'FamilyMemberHistory.name', 'min'=>0, 'max'=>1},
      'relationship' => {'type'=>'CodeableConcept', 'path'=>'FamilyMemberHistory.relationship', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-FamilyMember', 'uri'=>nil}},
      'sex' => {'type'=>'CodeableConcept', 'path'=>'FamilyMemberHistory.sex', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://build.fhir.org/valueset-administrative-gender.html', 'uri'=>nil}},
      'bornPeriod' => {'type'=>'Period', 'path'=>'FamilyMemberHistory.born[x]', 'min'=>0, 'max'=>1},
      'bornDate' => {'type'=>'date', 'path'=>'FamilyMemberHistory.born[x]', 'min'=>0, 'max'=>1},
      'bornString' => {'type'=>'string', 'path'=>'FamilyMemberHistory.born[x]', 'min'=>0, 'max'=>1},
      'ageAge' => {'type'=>'Age', 'path'=>'FamilyMemberHistory.age[x]', 'min'=>0, 'max'=>1},
      'ageRange' => {'type'=>'Range', 'path'=>'FamilyMemberHistory.age[x]', 'min'=>0, 'max'=>1},
      'ageString' => {'type'=>'string', 'path'=>'FamilyMemberHistory.age[x]', 'min'=>0, 'max'=>1},
      'estimatedAge' => {'type'=>'boolean', 'path'=>'FamilyMemberHistory.estimatedAge', 'min'=>0, 'max'=>1},
      'deceasedBoolean' => {'type'=>'boolean', 'path'=>'FamilyMemberHistory.deceased[x]', 'min'=>0, 'max'=>1},
      'deceasedAge' => {'type'=>'Age', 'path'=>'FamilyMemberHistory.deceased[x]', 'min'=>0, 'max'=>1},
      'deceasedRange' => {'type'=>'Range', 'path'=>'FamilyMemberHistory.deceased[x]', 'min'=>0, 'max'=>1},
      'deceasedDate' => {'type'=>'date', 'path'=>'FamilyMemberHistory.deceased[x]', 'min'=>0, 'max'=>1},
      'deceasedString' => {'type'=>'string', 'path'=>'FamilyMemberHistory.deceased[x]', 'min'=>0, 'max'=>1},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'FamilyMemberHistory.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinical-findings', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/AllergyIntolerance', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'FamilyMemberHistory.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'FamilyMemberHistory.note', 'min'=>0, 'max'=>Float::INFINITY},
      'condition' => {'type'=>'FamilyMemberHistory::Condition', 'path'=>'FamilyMemberHistory.condition', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Condition < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'onset' => ['Age', 'Range', 'Period', 'string']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Condition.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Condition.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Condition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Condition.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
        'outcome' => {'type'=>'CodeableConcept', 'path'=>'Condition.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-outcome', 'uri'=>nil}},
        'contributedToDeath' => {'type'=>'boolean', 'path'=>'Condition.contributedToDeath', 'min'=>0, 'max'=>1},
        'onsetAge' => {'type'=>'Age', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
        'onsetRange' => {'type'=>'Range', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
        'onsetPeriod' => {'type'=>'Period', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
        'onsetString' => {'type'=>'string', 'path'=>'Condition.onset[x]', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'Condition.note', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                 # 0-1 string
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :code               # 1-1 CodeableConcept
      attr_accessor :outcome            # 0-1 CodeableConcept
      attr_accessor :contributedToDeath # 0-1 boolean
      attr_accessor :onsetAge           # 0-1 Age
      attr_accessor :onsetRange         # 0-1 Range
      attr_accessor :onsetPeriod        # 0-1 Period
      attr_accessor :onsetString        # 0-1 string
      attr_accessor :note               # 0-* [ Annotation ]
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
    attr_accessor :instantiatesCanonical # 0-* [ canonical ]
    attr_accessor :instantiatesUri       # 0-* [ uri ]
    attr_accessor :status                # 1-1 code
    attr_accessor :dataAbsentReason      # 0-1 CodeableConcept
    attr_accessor :patient               # 1-1 Reference(Patient)
    attr_accessor :date                  # 0-1 dateTime
    attr_accessor :name                  # 0-1 string
    attr_accessor :relationship          # 1-1 CodeableConcept
    attr_accessor :sex                   # 0-1 CodeableConcept
    attr_accessor :bornPeriod            # 0-1 Period
    attr_accessor :bornDate              # 0-1 date
    attr_accessor :bornString            # 0-1 string
    attr_accessor :ageAge                # 0-1 Age
    attr_accessor :ageRange              # 0-1 Range
    attr_accessor :ageString             # 0-1 string
    attr_accessor :estimatedAge          # 0-1 boolean
    attr_accessor :deceasedBoolean       # 0-1 boolean
    attr_accessor :deceasedAge           # 0-1 Age
    attr_accessor :deceasedRange         # 0-1 Range
    attr_accessor :deceasedDate          # 0-1 date
    attr_accessor :deceasedString        # 0-1 string
    attr_accessor :reasonCode            # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference       # 0-* [ Reference(Condition|Observation|AllergyIntolerance|QuestionnaireResponse|DiagnosticReport|DocumentReference) ]
    attr_accessor :note                  # 0-* [ Annotation ]
    attr_accessor :condition             # 0-* [ FamilyMemberHistory::Condition ]

    def resourceType
      'FamilyMemberHistory'
    end
  end
end