module FHIR
  class SpecimenDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['container', 'identifier', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'SpecimenDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'SpecimenDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'SpecimenDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'SpecimenDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'SpecimenDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'SpecimenDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'SpecimenDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'SpecimenDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'SpecimenDefinition.identifier', 'min'=>0, 'max'=>1},
      'typeCollected' => {'type'=>'CodeableConcept', 'path'=>'SpecimenDefinition.typeCollected', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0487', 'uri'=>nil}},
      'patientPreparation' => {'type'=>'CodeableConcept', 'path'=>'SpecimenDefinition.patientPreparation', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/prepare-patient-prior-specimen-collection', 'uri'=>nil}},
      'timeAspect' => {'type'=>'string', 'path'=>'SpecimenDefinition.timeAspect', 'min'=>0, 'max'=>1},
      'collection' => {'type'=>'CodeableConcept', 'path'=>'SpecimenDefinition.collection', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/specimen-collection', 'uri'=>nil}},
      'typeTested' => {'type'=>'SpecimenDefinition::TypeTested', 'path'=>'SpecimenDefinition.typeTested', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class TypeTested < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'TypeTested.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'TypeTested.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'TypeTested.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'isDerived' => {'type'=>'boolean', 'path'=>'TypeTested.isDerived', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'TypeTested.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0487', 'uri'=>nil}},
        'preference' => {'type'=>'code', 'path'=>'TypeTested.preference', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/specimen-contained-preference|4.0.0', 'uri'=>nil}},
        'container' => {'type'=>'SpecimenDefinition::TypeTested::Container', 'path'=>'TypeTested.container', 'min'=>0, 'max'=>1},
        'requirement' => {'type'=>'string', 'path'=>'TypeTested.requirement', 'min'=>0, 'max'=>1},
        'retentionTime' => {'type'=>'Duration', 'path'=>'TypeTested.retentionTime', 'min'=>0, 'max'=>1},
        'rejectionCriterion' => {'type'=>'CodeableConcept', 'path'=>'TypeTested.rejectionCriterion', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/rejection-criteria', 'uri'=>nil}},
        'handling' => {'type'=>'SpecimenDefinition::TypeTested::Handling', 'path'=>'TypeTested.handling', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Container < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'minimumVolume' => ['Quantity', 'string']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Container.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Container.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Container.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'material' => {'type'=>'CodeableConcept', 'path'=>'Container.material', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/container-material', 'uri'=>nil}},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Container.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/specimen-container-type', 'uri'=>nil}},
          'cap' => {'type'=>'CodeableConcept', 'path'=>'Container.cap', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/container-cap', 'uri'=>nil}},
          'description' => {'type'=>'string', 'path'=>'Container.description', 'min'=>0, 'max'=>1},
          'capacity' => {'type'=>'Quantity', 'path'=>'Container.capacity', 'min'=>0, 'max'=>1},
          'minimumVolumeQuantity' => {'type'=>'Quantity', 'path'=>'Container.minimumVolume[x]', 'min'=>0, 'max'=>1},
          'minimumVolumeString' => {'type'=>'string', 'path'=>'Container.minimumVolume[x]', 'min'=>0, 'max'=>1},
          'additive' => {'type'=>'SpecimenDefinition::TypeTested::Container::Additive', 'path'=>'Container.additive', 'min'=>0, 'max'=>Float::INFINITY},
          'preparation' => {'type'=>'string', 'path'=>'Container.preparation', 'min'=>0, 'max'=>1}
        }

        class Additive < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'additive' => ['CodeableConcept', 'Reference']
          }
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Additive.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Additive.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Additive.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'additiveCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Additive.additive[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0371', 'uri'=>nil}},
            'additiveReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Additive.additive[x]', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                      # 0-1 string
          attr_accessor :extension               # 0-* [ Extension ]
          attr_accessor :modifierExtension       # 0-* [ Extension ]
          attr_accessor :additiveCodeableConcept # 1-1 CodeableConcept
          attr_accessor :additiveReference       # 1-1 Reference(Substance)
        end

        attr_accessor :id                    # 0-1 string
        attr_accessor :extension             # 0-* [ Extension ]
        attr_accessor :modifierExtension     # 0-* [ Extension ]
        attr_accessor :material              # 0-1 CodeableConcept
        attr_accessor :type                  # 0-1 CodeableConcept
        attr_accessor :cap                   # 0-1 CodeableConcept
        attr_accessor :description           # 0-1 string
        attr_accessor :capacity              # 0-1 Quantity
        attr_accessor :minimumVolumeQuantity # 0-1 Quantity
        attr_accessor :minimumVolumeString   # 0-1 string
        attr_accessor :additive              # 0-* [ SpecimenDefinition::TypeTested::Container::Additive ]
        attr_accessor :preparation           # 0-1 string
      end

      class Handling < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Handling.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Handling.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Handling.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'temperatureQualifier' => {'type'=>'CodeableConcept', 'path'=>'Handling.temperatureQualifier', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/handling-condition', 'uri'=>nil}},
          'temperatureRange' => {'type'=>'Range', 'path'=>'Handling.temperatureRange', 'min'=>0, 'max'=>1},
          'maxDuration' => {'type'=>'Duration', 'path'=>'Handling.maxDuration', 'min'=>0, 'max'=>1},
          'instruction' => {'type'=>'string', 'path'=>'Handling.instruction', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :temperatureQualifier # 0-1 CodeableConcept
        attr_accessor :temperatureRange     # 0-1 Range
        attr_accessor :maxDuration          # 0-1 Duration
        attr_accessor :instruction          # 0-1 string
      end

      attr_accessor :id                 # 0-1 string
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :isDerived          # 0-1 boolean
      attr_accessor :type               # 0-1 CodeableConcept
      attr_accessor :preference         # 1-1 code
      attr_accessor :container          # 0-1 SpecimenDefinition::TypeTested::Container
      attr_accessor :requirement        # 0-1 string
      attr_accessor :retentionTime      # 0-1 Duration
      attr_accessor :rejectionCriterion # 0-* [ CodeableConcept ]
      attr_accessor :handling           # 0-* [ SpecimenDefinition::TypeTested::Handling ]
    end

    attr_accessor :id                 # 0-1 id
    attr_accessor :meta               # 0-1 Meta
    attr_accessor :implicitRules      # 0-1 uri
    attr_accessor :language           # 0-1 code
    attr_accessor :text               # 0-1 Narrative
    attr_accessor :contained          # 0-* [ Resource ]
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :modifierExtension  # 0-* [ Extension ]
    attr_accessor :identifier         # 0-1 Identifier
    attr_accessor :typeCollected      # 0-1 CodeableConcept
    attr_accessor :patientPreparation # 0-* [ CodeableConcept ]
    attr_accessor :timeAspect         # 0-1 string
    attr_accessor :collection         # 0-* [ CodeableConcept ]
    attr_accessor :typeTested         # 0-* [ SpecimenDefinition::TypeTested ]

    def resourceType
      'SpecimenDefinition'
    end
  end
end