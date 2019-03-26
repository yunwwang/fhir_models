module FHIR
  class MedicinalProductContraindication < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicinalProductContraindication.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicinalProductContraindication.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicinalProductContraindication.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MedicinalProductContraindication.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicinalProductContraindication.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicinalProductContraindication.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicinalProductContraindication.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicinalProductContraindication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicinalProduct', 'http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicinalProductContraindication.subject', 'min'=>0, 'max'=>Float::INFINITY},
      'disease' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductContraindication.disease', 'min'=>0, 'max'=>1},
      'diseaseStatus' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductContraindication.diseaseStatus', 'min'=>0, 'max'=>1},
      'comorbidity' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductContraindication.comorbidity', 'min'=>0, 'max'=>Float::INFINITY},
      'therapeuticIndication' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicinalProductIndication'], 'type'=>'Reference', 'path'=>'MedicinalProductContraindication.therapeuticIndication', 'min'=>0, 'max'=>Float::INFINITY},
      'otherTherapy' => {'type'=>'MedicinalProductContraindication::OtherTherapy', 'path'=>'MedicinalProductContraindication.otherTherapy', 'min'=>0, 'max'=>Float::INFINITY},
      'population' => {'type'=>'Population', 'path'=>'MedicinalProductContraindication.population', 'min'=>0, 'max'=>Float::INFINITY}
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

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :subject               # 0-* [ Reference(MedicinalProduct|Medication) ]
    attr_accessor :disease               # 0-1 CodeableConcept
    attr_accessor :diseaseStatus         # 0-1 CodeableConcept
    attr_accessor :comorbidity           # 0-* [ CodeableConcept ]
    attr_accessor :therapeuticIndication # 0-* [ Reference(MedicinalProductIndication) ]
    attr_accessor :otherTherapy          # 0-* [ MedicinalProductContraindication::OtherTherapy ]
    attr_accessor :population            # 0-* [ Population ]

    def resourceType
      'MedicinalProductContraindication'
    end
  end
end