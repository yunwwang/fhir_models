module FHIR
  class Observation < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'effective' => ['dateTime', 'Period', 'Timing', 'instant'],
      'value' => ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']
    }
    SEARCH_PARAMS = ['code', 'date', 'identifier', 'patient', 'encounter', 'based-on', 'category', 'combo-code', 'combo-data-absent-reason', 'combo-value-concept', 'combo-value-quantity', 'component-code', 'component-data-absent-reason', 'component-value-concept', 'component-value-quantity', 'data-absent-reason', 'derived-from', 'device', 'focus', 'has-member', 'method', 'part-of', 'performer', 'specimen', 'status', 'subject', 'value-concept', 'value-date', 'value-quantity', 'value-string']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Observation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Observation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Observation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Observation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Observation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Observation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Observation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Observation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Observation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'Observation.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationAdministration', 'http://hl7.org/fhir/StructureDefinition/MedicationDispense', 'http://hl7.org/fhir/StructureDefinition/MedicationStatement', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Immunization', 'http://hl7.org/fhir/StructureDefinition/ImagingStudy'], 'type'=>'Reference', 'path'=>'Observation.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Observation.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-status|4.0.0', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'Observation.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-category', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'Observation.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-codes', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Observation.subject', 'min'=>0, 'max'=>1},
      'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Observation.focus', 'min'=>0, 'max'=>Float::INFINITY},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Observation.encounter', 'min'=>0, 'max'=>1},
      'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'Observation.effective[x]', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'Observation.effective[x]', 'min'=>0, 'max'=>1},
      'effectiveTiming' => {'type'=>'Timing', 'path'=>'Observation.effective[x]', 'min'=>0, 'max'=>1},
      'effectiveInstant' => {'type'=>'instant', 'path'=>'Observation.effective[x]', 'min'=>0, 'max'=>1},
      'issued' => {'type'=>'instant', 'path'=>'Observation.issued', 'min'=>0, 'max'=>1},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Observation.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'valueQuantity' => {'type'=>'Quantity', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueString' => {'type'=>'string', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueBoolean' => {'type'=>'boolean', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueInteger' => {'type'=>'integer', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueRange' => {'type'=>'Range', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueRatio' => {'type'=>'Ratio', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueSampledData' => {'type'=>'SampledData', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueTime' => {'type'=>'time', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valueDateTime' => {'type'=>'dateTime', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'valuePeriod' => {'type'=>'Period', 'path'=>'Observation.value[x]', 'min'=>0, 'max'=>1},
      'dataAbsentReason' => {'type'=>'CodeableConcept', 'path'=>'Observation.dataAbsentReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/data-absent-reason', 'uri'=>nil}},
      'interpretation' => {'type'=>'CodeableConcept', 'path'=>'Observation.interpretation', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-interpretation', 'uri'=>nil}},
      'note' => {'type'=>'Annotation', 'path'=>'Observation.note', 'min'=>0, 'max'=>Float::INFINITY},
      'bodySite' => {'type'=>'CodeableConcept', 'path'=>'Observation.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'Observation.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-methods', 'uri'=>nil}},
      'specimen' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'Observation.specimen', 'min'=>0, 'max'=>1},
      'device' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/DeviceMetric'], 'type'=>'Reference', 'path'=>'Observation.device', 'min'=>0, 'max'=>1},
      'referenceRange' => {'type'=>'Observation::ReferenceRange', 'path'=>'Observation.referenceRange', 'min'=>0, 'max'=>Float::INFINITY},
      'hasMember' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse', 'http://hl7.org/fhir/StructureDefinition/MolecularSequence'], 'type'=>'Reference', 'path'=>'Observation.hasMember', 'min'=>0, 'max'=>Float::INFINITY},
      'derivedFrom' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/ImagingStudy', 'http://hl7.org/fhir/StructureDefinition/Media', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/MolecularSequence'], 'type'=>'Reference', 'path'=>'Observation.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
      'component' => {'type'=>'Observation::Component', 'path'=>'Observation.component', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class ReferenceRange < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ReferenceRange.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ReferenceRange.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ReferenceRange.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'low' => {'type'=>'Quantity', 'path'=>'ReferenceRange.low', 'min'=>0, 'max'=>1},
        'high' => {'type'=>'Quantity', 'path'=>'ReferenceRange.high', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'ReferenceRange.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/referencerange-meaning', 'uri'=>nil}},
        'appliesTo' => {'type'=>'CodeableConcept', 'path'=>'ReferenceRange.appliesTo', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/referencerange-appliesto', 'uri'=>nil}},
        'age' => {'type'=>'Range', 'path'=>'ReferenceRange.age', 'min'=>0, 'max'=>1},
        'text' => {'type'=>'string', 'path'=>'ReferenceRange.text', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :low               # 0-1 Quantity
      attr_accessor :high              # 0-1 Quantity
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :appliesTo         # 0-* [ CodeableConcept ]
      attr_accessor :age               # 0-1 Range
      attr_accessor :text              # 0-1 string
    end

    class Component < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Component.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Component.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Component.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Component.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-codes', 'uri'=>nil}},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueInteger' => {'type'=>'integer', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueRatio' => {'type'=>'Ratio', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueSampledData' => {'type'=>'SampledData', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueTime' => {'type'=>'time', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'Component.value[x]', 'min'=>0, 'max'=>1},
        'dataAbsentReason' => {'type'=>'CodeableConcept', 'path'=>'Component.dataAbsentReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/data-absent-reason', 'uri'=>nil}},
        'interpretation' => {'type'=>'CodeableConcept', 'path'=>'Component.interpretation', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/observation-interpretation', 'uri'=>nil}},
        'referenceRange' => {'type'=>'Observation::ReferenceRange', 'path'=>'Component.referenceRange', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :code                 # 1-1 CodeableConcept
      attr_accessor :valueQuantity        # 0-1 Quantity
      attr_accessor :valueCodeableConcept # 0-1 CodeableConcept
      attr_accessor :valueString          # 0-1 string
      attr_accessor :valueBoolean         # 0-1 boolean
      attr_accessor :valueInteger         # 0-1 integer
      attr_accessor :valueRange           # 0-1 Range
      attr_accessor :valueRatio           # 0-1 Ratio
      attr_accessor :valueSampledData     # 0-1 SampledData
      attr_accessor :valueTime            # 0-1 time
      attr_accessor :valueDateTime        # 0-1 dateTime
      attr_accessor :valuePeriod          # 0-1 Period
      attr_accessor :dataAbsentReason     # 0-1 CodeableConcept
      attr_accessor :interpretation       # 0-* [ CodeableConcept ]
      attr_accessor :referenceRange       # 0-* [ Observation::ReferenceRange ]
    end

    attr_accessor :id                   # 0-1 id
    attr_accessor :meta                 # 0-1 Meta
    attr_accessor :implicitRules        # 0-1 uri
    attr_accessor :language             # 0-1 code
    attr_accessor :text                 # 0-1 Narrative
    attr_accessor :contained            # 0-* [ Resource ]
    attr_accessor :extension            # 0-* [ Extension ]
    attr_accessor :modifierExtension    # 0-* [ Extension ]
    attr_accessor :identifier           # 0-* [ Identifier ]
    attr_accessor :basedOn              # 0-* [ Reference(CarePlan|DeviceRequest|ImmunizationRecommendation|MedicationRequest|NutritionOrder|ServiceRequest) ]
    attr_accessor :partOf               # 0-* [ Reference(MedicationAdministration|MedicationDispense|MedicationStatement|Procedure|Immunization|ImagingStudy) ]
    attr_accessor :status               # 1-1 code
    attr_accessor :category             # 0-* [ CodeableConcept ]
    attr_accessor :code                 # 1-1 CodeableConcept
    attr_accessor :subject              # 0-1 Reference(Patient|Group|Device|Location)
    attr_accessor :focus                # 0-* [ Reference(Resource) ]
    attr_accessor :encounter            # 0-1 Reference(Encounter)
    attr_accessor :effectiveDateTime    # 0-1 dateTime
    attr_accessor :effectivePeriod      # 0-1 Period
    attr_accessor :effectiveTiming      # 0-1 Timing
    attr_accessor :effectiveInstant     # 0-1 instant
    attr_accessor :issued               # 0-1 instant
    attr_accessor :performer            # 0-* [ Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|RelatedPerson) ]
    attr_accessor :valueQuantity        # 0-1 Quantity
    attr_accessor :valueCodeableConcept # 0-1 CodeableConcept
    attr_accessor :valueString          # 0-1 string
    attr_accessor :valueBoolean         # 0-1 boolean
    attr_accessor :valueInteger         # 0-1 integer
    attr_accessor :valueRange           # 0-1 Range
    attr_accessor :valueRatio           # 0-1 Ratio
    attr_accessor :valueSampledData     # 0-1 SampledData
    attr_accessor :valueTime            # 0-1 time
    attr_accessor :valueDateTime        # 0-1 dateTime
    attr_accessor :valuePeriod          # 0-1 Period
    attr_accessor :dataAbsentReason     # 0-1 CodeableConcept
    attr_accessor :interpretation       # 0-* [ CodeableConcept ]
    attr_accessor :note                 # 0-* [ Annotation ]
    attr_accessor :bodySite             # 0-1 CodeableConcept
    attr_accessor :local_method         # 0-1 CodeableConcept
    attr_accessor :specimen             # 0-1 Reference(Specimen)
    attr_accessor :device               # 0-1 Reference(Device|DeviceMetric)
    attr_accessor :referenceRange       # 0-* [ Observation::ReferenceRange ]
    attr_accessor :hasMember            # 0-* [ Reference(Observation|QuestionnaireResponse|MolecularSequence) ]
    attr_accessor :derivedFrom          # 0-* [ Reference(DocumentReference|ImagingStudy|Media|QuestionnaireResponse|Observation|MolecularSequence) ]
    attr_accessor :component            # 0-* [ Observation::Component ]

    def resourceType
      'Observation'
    end
  end
end