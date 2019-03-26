module FHIR
  class AllergyIntolerance < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'onset' => ['dateTime', 'Age', 'Period', 'Range', 'string']
    }
    SEARCH_PARAMS = ['asserter', 'category', 'clinical-status', 'code', 'criticality', 'date', 'identifier', 'last-date', 'manifestation', 'onset', 'patient', 'recorder', 'route', 'severity', 'type', 'verification-status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'AllergyIntolerance.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'AllergyIntolerance.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'AllergyIntolerance.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'AllergyIntolerance.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'AllergyIntolerance.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'AllergyIntolerance.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'AllergyIntolerance.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'AllergyIntolerance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'AllergyIntolerance.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'clinicalStatus' => {'type'=>'CodeableConcept', 'path'=>'AllergyIntolerance.clinicalStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/allergyintolerance-clinical|4.0.0', 'uri'=>nil}},
      'verificationStatus' => {'type'=>'CodeableConcept', 'path'=>'AllergyIntolerance.verificationStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/allergyintolerance-verification|4.0.0', 'uri'=>nil}},
      'type' => {'type'=>'code', 'path'=>'AllergyIntolerance.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/allergy-intolerance-type|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'code', 'path'=>'AllergyIntolerance.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/allergy-intolerance-category|4.0.0', 'uri'=>nil}},
      'criticality' => {'type'=>'code', 'path'=>'AllergyIntolerance.criticality', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality|4.0.0', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'AllergyIntolerance.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/allergyintolerance-code', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'AllergyIntolerance.patient', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'AllergyIntolerance.encounter', 'min'=>0, 'max'=>1},
      'onsetDateTime' => {'type'=>'dateTime', 'path'=>'AllergyIntolerance.onset[x]', 'min'=>0, 'max'=>1},
      'onsetAge' => {'type'=>'Age', 'path'=>'AllergyIntolerance.onset[x]', 'min'=>0, 'max'=>1},
      'onsetPeriod' => {'type'=>'Period', 'path'=>'AllergyIntolerance.onset[x]', 'min'=>0, 'max'=>1},
      'onsetRange' => {'type'=>'Range', 'path'=>'AllergyIntolerance.onset[x]', 'min'=>0, 'max'=>1},
      'onsetString' => {'type'=>'string', 'path'=>'AllergyIntolerance.onset[x]', 'min'=>0, 'max'=>1},
      'recordedDate' => {'type'=>'dateTime', 'path'=>'AllergyIntolerance.recordedDate', 'min'=>0, 'max'=>1},
      'recorder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'AllergyIntolerance.recorder', 'min'=>0, 'max'=>1},
      'asserter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'AllergyIntolerance.asserter', 'min'=>0, 'max'=>1},
      'lastOccurrence' => {'type'=>'dateTime', 'path'=>'AllergyIntolerance.lastOccurrence', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'AllergyIntolerance.note', 'min'=>0, 'max'=>Float::INFINITY},
      'reaction' => {'type'=>'AllergyIntolerance::Reaction', 'path'=>'AllergyIntolerance.reaction', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Reaction < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Reaction.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Reaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Reaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'substance' => {'type'=>'CodeableConcept', 'path'=>'Reaction.substance', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/substance-code', 'uri'=>nil}},
        'manifestation' => {'type'=>'CodeableConcept', 'path'=>'Reaction.manifestation', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/clinical-findings', 'uri'=>nil}},
        'description' => {'type'=>'string', 'path'=>'Reaction.description', 'min'=>0, 'max'=>1},
        'onset' => {'type'=>'dateTime', 'path'=>'Reaction.onset', 'min'=>0, 'max'=>1},
        'severity' => {'type'=>'code', 'path'=>'Reaction.severity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/reaction-event-severity|4.0.0', 'uri'=>nil}},
        'exposureRoute' => {'type'=>'CodeableConcept', 'path'=>'Reaction.exposureRoute', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/route-codes', 'uri'=>nil}},
        'note' => {'type'=>'Annotation', 'path'=>'Reaction.note', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :substance         # 0-1 CodeableConcept
      attr_accessor :manifestation     # 1-* [ CodeableConcept ]
      attr_accessor :description       # 0-1 string
      attr_accessor :onset             # 0-1 dateTime
      attr_accessor :severity          # 0-1 code
      attr_accessor :exposureRoute     # 0-1 CodeableConcept
      attr_accessor :note              # 0-* [ Annotation ]
    end

    attr_accessor :id                 # 0-1 id
    attr_accessor :meta               # 0-1 Meta
    attr_accessor :implicitRules      # 0-1 uri
    attr_accessor :language           # 0-1 code
    attr_accessor :text               # 0-1 Narrative
    attr_accessor :contained          # 0-* [ Resource ]
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :modifierExtension  # 0-* [ Extension ]
    attr_accessor :identifier         # 0-* [ Identifier ]
    attr_accessor :clinicalStatus     # 0-1 CodeableConcept
    attr_accessor :verificationStatus # 0-1 CodeableConcept
    attr_accessor :type               # 0-1 code
    attr_accessor :category           # 0-* [ code ]
    attr_accessor :criticality        # 0-1 code
    attr_accessor :code               # 0-1 CodeableConcept
    attr_accessor :patient            # 1-1 Reference(Patient)
    attr_accessor :encounter          # 0-1 Reference(Encounter)
    attr_accessor :onsetDateTime      # 0-1 dateTime
    attr_accessor :onsetAge           # 0-1 Age
    attr_accessor :onsetPeriod        # 0-1 Period
    attr_accessor :onsetRange         # 0-1 Range
    attr_accessor :onsetString        # 0-1 string
    attr_accessor :recordedDate       # 0-1 dateTime
    attr_accessor :recorder           # 0-1 Reference(Practitioner|PractitionerRole|Patient|RelatedPerson)
    attr_accessor :asserter           # 0-1 Reference(Patient|RelatedPerson|Practitioner|PractitionerRole)
    attr_accessor :lastOccurrence     # 0-1 dateTime
    attr_accessor :note               # 0-* [ Annotation ]
    attr_accessor :reaction           # 0-* [ AllergyIntolerance::Reaction ]

    def resourceType
      'AllergyIntolerance'
    end
  end
end