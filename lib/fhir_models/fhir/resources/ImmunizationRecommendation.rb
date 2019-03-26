module FHIR
  class ImmunizationRecommendation < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'identifier', 'information', 'patient', 'status', 'support', 'target-disease', 'vaccine-type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ImmunizationRecommendation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ImmunizationRecommendation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ImmunizationRecommendation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ImmunizationRecommendation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ImmunizationRecommendation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ImmunizationRecommendation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ImmunizationRecommendation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ImmunizationRecommendation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ImmunizationRecommendation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ImmunizationRecommendation.patient', 'min'=>1, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ImmunizationRecommendation.date', 'min'=>1, 'max'=>1},
      'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ImmunizationRecommendation.authority', 'min'=>0, 'max'=>1},
      'recommendation' => {'type'=>'ImmunizationRecommendation::Recommendation', 'path'=>'ImmunizationRecommendation.recommendation', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class Recommendation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'doseNumber' => ['positiveInt', 'string'],
        'seriesDoses' => ['positiveInt', 'string']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Recommendation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Recommendation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Recommendation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'vaccineCode' => {'type'=>'CodeableConcept', 'path'=>'Recommendation.vaccineCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/vaccine-code', 'uri'=>nil}},
        'targetDisease' => {'type'=>'CodeableConcept', 'path'=>'Recommendation.targetDisease', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-target-disease', 'uri'=>nil}},
        'contraindicatedVaccineCode' => {'type'=>'CodeableConcept', 'path'=>'Recommendation.contraindicatedVaccineCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/vaccine-code', 'uri'=>nil}},
        'forecastStatus' => {'type'=>'CodeableConcept', 'path'=>'Recommendation.forecastStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-status', 'uri'=>nil}},
        'forecastReason' => {'type'=>'CodeableConcept', 'path'=>'Recommendation.forecastReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-reason', 'uri'=>nil}},
        'dateCriterion' => {'type'=>'ImmunizationRecommendation::Recommendation::DateCriterion', 'path'=>'Recommendation.dateCriterion', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Recommendation.description', 'min'=>0, 'max'=>1},
        'series' => {'type'=>'string', 'path'=>'Recommendation.series', 'min'=>0, 'max'=>1},
        'doseNumberPositiveInt' => {'type'=>'positiveInt', 'path'=>'Recommendation.doseNumber[x]', 'min'=>0, 'max'=>1},
        'doseNumberString' => {'type'=>'string', 'path'=>'Recommendation.doseNumber[x]', 'min'=>0, 'max'=>1},
        'seriesDosesPositiveInt' => {'type'=>'positiveInt', 'path'=>'Recommendation.seriesDoses[x]', 'min'=>0, 'max'=>1},
        'seriesDosesString' => {'type'=>'string', 'path'=>'Recommendation.seriesDoses[x]', 'min'=>0, 'max'=>1},
        'supportingImmunization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Immunization', 'http://hl7.org/fhir/StructureDefinition/ImmunizationEvaluation'], 'type'=>'Reference', 'path'=>'Recommendation.supportingImmunization', 'min'=>0, 'max'=>Float::INFINITY},
        'supportingPatientInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Recommendation.supportingPatientInformation', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class DateCriterion < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'DateCriterion.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'DateCriterion.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'DateCriterion.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'type'=>'CodeableConcept', 'path'=>'DateCriterion.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-date-criterion', 'uri'=>nil}},
          'value' => {'type'=>'dateTime', 'path'=>'DateCriterion.value', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 CodeableConcept
        attr_accessor :value             # 1-1 dateTime
      end

      attr_accessor :id                           # 0-1 string
      attr_accessor :extension                    # 0-* [ Extension ]
      attr_accessor :modifierExtension            # 0-* [ Extension ]
      attr_accessor :vaccineCode                  # 0-* [ CodeableConcept ]
      attr_accessor :targetDisease                # 0-1 CodeableConcept
      attr_accessor :contraindicatedVaccineCode   # 0-* [ CodeableConcept ]
      attr_accessor :forecastStatus               # 1-1 CodeableConcept
      attr_accessor :forecastReason               # 0-* [ CodeableConcept ]
      attr_accessor :dateCriterion                # 0-* [ ImmunizationRecommendation::Recommendation::DateCriterion ]
      attr_accessor :description                  # 0-1 string
      attr_accessor :series                       # 0-1 string
      attr_accessor :doseNumberPositiveInt        # 0-1 positiveInt
      attr_accessor :doseNumberString             # 0-1 string
      attr_accessor :seriesDosesPositiveInt       # 0-1 positiveInt
      attr_accessor :seriesDosesString            # 0-1 string
      attr_accessor :supportingImmunization       # 0-* [ Reference(Immunization|ImmunizationEvaluation) ]
      attr_accessor :supportingPatientInformation # 0-* [ Reference(Resource) ]
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
    attr_accessor :patient           # 1-1 Reference(Patient)
    attr_accessor :date              # 1-1 dateTime
    attr_accessor :authority         # 0-1 Reference(Organization)
    attr_accessor :recommendation    # 1-* [ ImmunizationRecommendation::Recommendation ]

    def resourceType
      'ImmunizationRecommendation'
    end
  end
end