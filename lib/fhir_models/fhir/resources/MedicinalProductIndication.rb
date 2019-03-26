module FHIR
  class MedicinalProductIndication < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicinalProductIndication.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicinalProductIndication.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicinalProductIndication.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MedicinalProductIndication.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicinalProductIndication.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicinalProductIndication.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicinalProductIndication.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicinalProductIndication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicinalProduct', 'http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicinalProductIndication.subject', 'min'=>0, 'max'=>Float::INFINITY},
      'diseaseSymptomProcedure' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductIndication.diseaseSymptomProcedure', 'min'=>0, 'max'=>1},
      'diseaseStatus' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductIndication.diseaseStatus', 'min'=>0, 'max'=>1},
      'comorbidity' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductIndication.comorbidity', 'min'=>0, 'max'=>Float::INFINITY},
      'intendedEffect' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductIndication.intendedEffect', 'min'=>0, 'max'=>1},
      'duration' => {'type'=>'Quantity', 'path'=>'MedicinalProductIndication.duration', 'min'=>0, 'max'=>1},
      'otherTherapy' => {'type'=>'MedicinalProductIndication::OtherTherapy', 'path'=>'MedicinalProductIndication.otherTherapy', 'min'=>0, 'max'=>Float::INFINITY},
      'undesirableEffect' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicinalProductUndesirableEffect'], 'type'=>'Reference', 'path'=>'MedicinalProductIndication.undesirableEffect', 'min'=>0, 'max'=>Float::INFINITY},
      'population' => {'type'=>'Population', 'path'=>'MedicinalProductIndication.population', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class OtherTherapy < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'medication' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'OtherTherapy.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'OtherTherapy.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'OtherTherapy.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'therapyRelationshipType' => {'type'=>'CodeableConcept', 'path'=>'OtherTherapy.therapyRelationshipType', 'min'=>1, 'max'=>1},
        'medicationCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'OtherTherapy.medication[x]', 'min'=>1, 'max'=>1},
        'medicationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicinalProduct', 'http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/SubstanceSpecification'], 'type'=>'Reference', 'path'=>'OtherTherapy.medication[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                        # 0-1 string
      attr_accessor :extension                 # 0-* [ Extension ]
      attr_accessor :modifierExtension         # 0-* [ Extension ]
      attr_accessor :therapyRelationshipType   # 1-1 CodeableConcept
      attr_accessor :medicationCodeableConcept # 1-1 CodeableConcept
      attr_accessor :medicationReference       # 1-1 Reference(MedicinalProduct|Medication|Substance|SubstanceSpecification)
    end

    attr_accessor :id                      # 0-1 id
    attr_accessor :meta                    # 0-1 Meta
    attr_accessor :implicitRules           # 0-1 uri
    attr_accessor :language                # 0-1 code
    attr_accessor :text                    # 0-1 Narrative
    attr_accessor :contained               # 0-* [ Resource ]
    attr_accessor :extension               # 0-* [ Extension ]
    attr_accessor :modifierExtension       # 0-* [ Extension ]
    attr_accessor :subject                 # 0-* [ Reference(MedicinalProduct|Medication) ]
    attr_accessor :diseaseSymptomProcedure # 0-1 CodeableConcept
    attr_accessor :diseaseStatus           # 0-1 CodeableConcept
    attr_accessor :comorbidity             # 0-* [ CodeableConcept ]
    attr_accessor :intendedEffect          # 0-1 CodeableConcept
    attr_accessor :duration                # 0-1 Quantity
    attr_accessor :otherTherapy            # 0-* [ MedicinalProductIndication::OtherTherapy ]
    attr_accessor :undesirableEffect       # 0-* [ Reference(MedicinalProductUndesirableEffect) ]
    attr_accessor :population              # 0-* [ Population ]

    def resourceType
      'MedicinalProductIndication'
    end
  end
end