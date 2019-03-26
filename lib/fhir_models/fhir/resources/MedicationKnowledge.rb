module FHIR
  class MedicationKnowledge < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['classification', 'classification-type', 'code', 'doseform', 'ingredient', 'ingredient-code', 'manufacturer', 'monitoring-program-name', 'monitoring-program-type', 'monograph', 'monograph-type', 'source-cost', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicationKnowledge.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicationKnowledge.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicationKnowledge.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MedicationKnowledge.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicationKnowledge.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicationKnowledge.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicationKnowledge.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationKnowledge.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'code' => {'type'=>'CodeableConcept', 'path'=>'MedicationKnowledge.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-codes', 'uri'=>nil}},
      'status' => {'type'=>'code', 'path'=>'MedicationKnowledge.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationknowledge-status|4.0.0', 'uri'=>nil}},
      'manufacturer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'MedicationKnowledge.manufacturer', 'min'=>0, 'max'=>1},
      'doseForm' => {'type'=>'CodeableConcept', 'path'=>'MedicationKnowledge.doseForm', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-form-codes', 'uri'=>nil}},
      'amount' => {'type'=>'Quantity', 'path'=>'MedicationKnowledge.amount', 'min'=>0, 'max'=>1},
      'synonym' => {'type'=>'string', 'path'=>'MedicationKnowledge.synonym', 'min'=>0, 'max'=>Float::INFINITY},
      'relatedMedicationKnowledge' => {'type'=>'MedicationKnowledge::RelatedMedicationKnowledge', 'path'=>'MedicationKnowledge.relatedMedicationKnowledge', 'min'=>0, 'max'=>Float::INFINITY},
      'associatedMedication' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicationKnowledge.associatedMedication', 'min'=>0, 'max'=>Float::INFINITY},
      'productType' => {'type'=>'CodeableConcept', 'path'=>'MedicationKnowledge.productType', 'min'=>0, 'max'=>Float::INFINITY},
      'monograph' => {'type'=>'MedicationKnowledge::Monograph', 'path'=>'MedicationKnowledge.monograph', 'min'=>0, 'max'=>Float::INFINITY},
      'ingredient' => {'type'=>'MedicationKnowledge::Ingredient', 'path'=>'MedicationKnowledge.ingredient', 'min'=>0, 'max'=>Float::INFINITY},
      'preparationInstruction' => {'type'=>'markdown', 'path'=>'MedicationKnowledge.preparationInstruction', 'min'=>0, 'max'=>1},
      'intendedRoute' => {'type'=>'CodeableConcept', 'path'=>'MedicationKnowledge.intendedRoute', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/route-codes', 'uri'=>nil}},
      'cost' => {'type'=>'MedicationKnowledge::Cost', 'path'=>'MedicationKnowledge.cost', 'min'=>0, 'max'=>Float::INFINITY},
      'monitoringProgram' => {'type'=>'MedicationKnowledge::MonitoringProgram', 'path'=>'MedicationKnowledge.monitoringProgram', 'min'=>0, 'max'=>Float::INFINITY},
      'administrationGuidelines' => {'type'=>'MedicationKnowledge::AdministrationGuidelines', 'path'=>'MedicationKnowledge.administrationGuidelines', 'min'=>0, 'max'=>Float::INFINITY},
      'medicineClassification' => {'type'=>'MedicationKnowledge::MedicineClassification', 'path'=>'MedicationKnowledge.medicineClassification', 'min'=>0, 'max'=>Float::INFINITY},
      'packaging' => {'type'=>'MedicationKnowledge::Packaging', 'path'=>'MedicationKnowledge.packaging', 'min'=>0, 'max'=>1},
      'drugCharacteristic' => {'type'=>'MedicationKnowledge::DrugCharacteristic', 'path'=>'MedicationKnowledge.drugCharacteristic', 'min'=>0, 'max'=>Float::INFINITY},
      'contraindication' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DetectedIssue'], 'type'=>'Reference', 'path'=>'MedicationKnowledge.contraindication', 'min'=>0, 'max'=>Float::INFINITY},
      'regulatory' => {'type'=>'MedicationKnowledge::Regulatory', 'path'=>'MedicationKnowledge.regulatory', 'min'=>0, 'max'=>Float::INFINITY},
      'kinetics' => {'type'=>'MedicationKnowledge::Kinetics', 'path'=>'MedicationKnowledge.kinetics', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class RelatedMedicationKnowledge < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'RelatedMedicationKnowledge.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'RelatedMedicationKnowledge.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatedMedicationKnowledge.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'RelatedMedicationKnowledge.type', 'min'=>1, 'max'=>1},
        'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationKnowledge'], 'type'=>'Reference', 'path'=>'RelatedMedicationKnowledge.reference', 'min'=>1, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :reference         # 1-* [ Reference(MedicationKnowledge) ]
    end

    class Monograph < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Monograph.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Monograph.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Monograph.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Monograph.type', 'min'=>0, 'max'=>1},
        'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/Media'], 'type'=>'Reference', 'path'=>'Monograph.source', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :source            # 0-1 Reference(DocumentReference|Media)
    end

    class Ingredient < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'item' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Ingredient.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Ingredient.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Ingredient.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'itemCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Ingredient.item[x]', 'min'=>1, 'max'=>1},
        'itemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Ingredient.item[x]', 'min'=>1, 'max'=>1},
        'isActive' => {'type'=>'boolean', 'path'=>'Ingredient.isActive', 'min'=>0, 'max'=>1},
        'strength' => {'type'=>'Ratio', 'path'=>'Ingredient.strength', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :itemCodeableConcept # 1-1 CodeableConcept
      attr_accessor :itemReference       # 1-1 Reference(Substance)
      attr_accessor :isActive            # 0-1 boolean
      attr_accessor :strength            # 0-1 Ratio
    end

    class Cost < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Cost.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Cost.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Cost.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Cost.type', 'min'=>1, 'max'=>1},
        'source' => {'type'=>'string', 'path'=>'Cost.source', 'min'=>0, 'max'=>1},
        'cost' => {'type'=>'Money', 'path'=>'Cost.cost', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :source            # 0-1 string
      attr_accessor :cost              # 1-1 Money
    end

    class MonitoringProgram < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'MonitoringProgram.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'MonitoringProgram.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MonitoringProgram.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'MonitoringProgram.type', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'MonitoringProgram.name', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :name              # 0-1 string
    end

    class AdministrationGuidelines < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'indication' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'AdministrationGuidelines.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'AdministrationGuidelines.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'AdministrationGuidelines.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'dosage' => {'type'=>'MedicationKnowledge::AdministrationGuidelines::Dosage', 'path'=>'AdministrationGuidelines.dosage', 'min'=>0, 'max'=>Float::INFINITY},
        'indicationCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'AdministrationGuidelines.indication[x]', 'min'=>0, 'max'=>1},
        'indicationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ObservationDefinition'], 'type'=>'Reference', 'path'=>'AdministrationGuidelines.indication[x]', 'min'=>0, 'max'=>1},
        'patientCharacteristics' => {'type'=>'MedicationKnowledge::AdministrationGuidelines::PatientCharacteristics', 'path'=>'AdministrationGuidelines.patientCharacteristics', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Dosage < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Dosage.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Dosage.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Dosage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Dosage.type', 'min'=>1, 'max'=>1},
          'dosage' => {'type'=>'Dosage', 'path'=>'Dosage.dosage', 'min'=>1, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :dosage            # 1-* [ Dosage ]
      end

      class PatientCharacteristics < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'characteristic' => ['CodeableConcept', 'Quantity']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'PatientCharacteristics.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'PatientCharacteristics.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'PatientCharacteristics.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'characteristicCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'PatientCharacteristics.characteristic[x]', 'min'=>1, 'max'=>1},
          'characteristicQuantity' => {'type'=>'Quantity', 'path'=>'PatientCharacteristics.characteristic[x]', 'min'=>1, 'max'=>1},
          'value' => {'type'=>'string', 'path'=>'PatientCharacteristics.value', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                            # 0-1 string
        attr_accessor :extension                     # 0-* [ Extension ]
        attr_accessor :modifierExtension             # 0-* [ Extension ]
        attr_accessor :characteristicCodeableConcept # 1-1 CodeableConcept
        attr_accessor :characteristicQuantity        # 1-1 Quantity
        attr_accessor :value                         # 0-* [ string ]
      end

      attr_accessor :id                        # 0-1 string
      attr_accessor :extension                 # 0-* [ Extension ]
      attr_accessor :modifierExtension         # 0-* [ Extension ]
      attr_accessor :dosage                    # 0-* [ MedicationKnowledge::AdministrationGuidelines::Dosage ]
      attr_accessor :indicationCodeableConcept # 0-1 CodeableConcept
      attr_accessor :indicationReference       # 0-1 Reference(ObservationDefinition)
      attr_accessor :patientCharacteristics    # 0-* [ MedicationKnowledge::AdministrationGuidelines::PatientCharacteristics ]
    end

    class MedicineClassification < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'MedicineClassification.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'MedicineClassification.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicineClassification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'MedicineClassification.type', 'min'=>1, 'max'=>1},
        'classification' => {'type'=>'CodeableConcept', 'path'=>'MedicineClassification.classification', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :classification    # 0-* [ CodeableConcept ]
    end

    class Packaging < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Packaging.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Packaging.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Packaging.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Packaging.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationknowledge-package-type', 'uri'=>nil}},
        'quantity' => {'type'=>'Quantity', 'path'=>'Packaging.quantity', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :quantity          # 0-1 Quantity
    end

    class DrugCharacteristic < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['CodeableConcept', 'string', 'Quantity', 'base64Binary']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DrugCharacteristic.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DrugCharacteristic.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DrugCharacteristic.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'DrugCharacteristic.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medicationknowledge-characteristic', 'uri'=>nil}},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'DrugCharacteristic.value[x]', 'min'=>0, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'DrugCharacteristic.value[x]', 'min'=>0, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'DrugCharacteristic.value[x]', 'min'=>0, 'max'=>1},
        'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'DrugCharacteristic.value[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :type                 # 0-1 CodeableConcept
      attr_accessor :valueCodeableConcept # 0-1 CodeableConcept
      attr_accessor :valueString          # 0-1 string
      attr_accessor :valueQuantity        # 0-1 Quantity
      attr_accessor :valueBase64Binary    # 0-1 base64Binary
    end

    class Regulatory < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Regulatory.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Regulatory.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Regulatory.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'regulatoryAuthority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Regulatory.regulatoryAuthority', 'min'=>1, 'max'=>1},
        'substitution' => {'type'=>'MedicationKnowledge::Regulatory::Substitution', 'path'=>'Regulatory.substitution', 'min'=>0, 'max'=>Float::INFINITY},
        'schedule' => {'type'=>'MedicationKnowledge::Regulatory::Schedule', 'path'=>'Regulatory.schedule', 'min'=>0, 'max'=>Float::INFINITY},
        'maxDispense' => {'type'=>'MedicationKnowledge::Regulatory::MaxDispense', 'path'=>'Regulatory.maxDispense', 'min'=>0, 'max'=>1}
      }

      class Substitution < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Substitution.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Substitution.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Substitution.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Substitution.type', 'min'=>1, 'max'=>1},
          'allowed' => {'type'=>'boolean', 'path'=>'Substitution.allowed', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :allowed           # 1-1 boolean
      end

      class Schedule < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Schedule.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Schedule.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Schedule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'schedule' => {'type'=>'CodeableConcept', 'path'=>'Schedule.schedule', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :schedule          # 1-1 CodeableConcept
      end

      class MaxDispense < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'MaxDispense.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'MaxDispense.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'MaxDispense.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'quantity' => {'type'=>'Quantity', 'path'=>'MaxDispense.quantity', 'min'=>1, 'max'=>1},
          'period' => {'type'=>'Duration', 'path'=>'MaxDispense.period', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :quantity          # 1-1 Quantity
        attr_accessor :period            # 0-1 Duration
      end

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :regulatoryAuthority # 1-1 Reference(Organization)
      attr_accessor :substitution        # 0-* [ MedicationKnowledge::Regulatory::Substitution ]
      attr_accessor :schedule            # 0-* [ MedicationKnowledge::Regulatory::Schedule ]
      attr_accessor :maxDispense         # 0-1 MedicationKnowledge::Regulatory::MaxDispense
    end

    class Kinetics < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Kinetics.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Kinetics.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Kinetics.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'areaUnderCurve' => {'type'=>'Quantity', 'path'=>'Kinetics.areaUnderCurve', 'min'=>0, 'max'=>Float::INFINITY},
        'lethalDose50' => {'type'=>'Quantity', 'path'=>'Kinetics.lethalDose50', 'min'=>0, 'max'=>Float::INFINITY},
        'halfLifePeriod' => {'type'=>'Duration', 'path'=>'Kinetics.halfLifePeriod', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :areaUnderCurve    # 0-* [ Quantity ]
      attr_accessor :lethalDose50      # 0-* [ Quantity ]
      attr_accessor :halfLifePeriod    # 0-1 Duration
    end

    attr_accessor :id                         # 0-1 id
    attr_accessor :meta                       # 0-1 Meta
    attr_accessor :implicitRules              # 0-1 uri
    attr_accessor :language                   # 0-1 code
    attr_accessor :text                       # 0-1 Narrative
    attr_accessor :contained                  # 0-* [ Resource ]
    attr_accessor :extension                  # 0-* [ Extension ]
    attr_accessor :modifierExtension          # 0-* [ Extension ]
    attr_accessor :code                       # 0-1 CodeableConcept
    attr_accessor :status                     # 0-1 code
    attr_accessor :manufacturer               # 0-1 Reference(Organization)
    attr_accessor :doseForm                   # 0-1 CodeableConcept
    attr_accessor :amount                     # 0-1 Quantity
    attr_accessor :synonym                    # 0-* [ string ]
    attr_accessor :relatedMedicationKnowledge # 0-* [ MedicationKnowledge::RelatedMedicationKnowledge ]
    attr_accessor :associatedMedication       # 0-* [ Reference(Medication) ]
    attr_accessor :productType                # 0-* [ CodeableConcept ]
    attr_accessor :monograph                  # 0-* [ MedicationKnowledge::Monograph ]
    attr_accessor :ingredient                 # 0-* [ MedicationKnowledge::Ingredient ]
    attr_accessor :preparationInstruction     # 0-1 markdown
    attr_accessor :intendedRoute              # 0-* [ CodeableConcept ]
    attr_accessor :cost                       # 0-* [ MedicationKnowledge::Cost ]
    attr_accessor :monitoringProgram          # 0-* [ MedicationKnowledge::MonitoringProgram ]
    attr_accessor :administrationGuidelines   # 0-* [ MedicationKnowledge::AdministrationGuidelines ]
    attr_accessor :medicineClassification     # 0-* [ MedicationKnowledge::MedicineClassification ]
    attr_accessor :packaging                  # 0-1 MedicationKnowledge::Packaging
    attr_accessor :drugCharacteristic         # 0-* [ MedicationKnowledge::DrugCharacteristic ]
    attr_accessor :contraindication           # 0-* [ Reference(DetectedIssue) ]
    attr_accessor :regulatory                 # 0-* [ MedicationKnowledge::Regulatory ]
    attr_accessor :kinetics                   # 0-* [ MedicationKnowledge::Kinetics ]

    def resourceType
      'MedicationKnowledge'
    end
  end
end