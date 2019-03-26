module FHIR
  class Specimen < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['accession', 'bodysite', 'collected', 'collector', 'container', 'container-id', 'identifier', 'parent', 'patient', 'status', 'subject', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Specimen.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Specimen.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Specimen.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Specimen.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Specimen.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Specimen.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Specimen.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Specimen.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Specimen.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'accessionIdentifier' => {'type'=>'Identifier', 'path'=>'Specimen.accessionIdentifier', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'Specimen.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/specimen-status|4.0.0', 'uri'=>nil}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'Specimen.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0487', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Specimen.subject', 'min'=>0, 'max'=>1},
      'receivedTime' => {'type'=>'dateTime', 'path'=>'Specimen.receivedTime', 'min'=>0, 'max'=>1},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'Specimen.parent', 'min'=>0, 'max'=>Float::INFINITY},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'Specimen.request', 'min'=>0, 'max'=>Float::INFINITY},
      'collection' => {'type'=>'Specimen::Collection', 'path'=>'Specimen.collection', 'min'=>0, 'max'=>1},
      'processing' => {'type'=>'Specimen::Processing', 'path'=>'Specimen.processing', 'min'=>0, 'max'=>Float::INFINITY},
      'container' => {'type'=>'Specimen::Container', 'path'=>'Specimen.container', 'min'=>0, 'max'=>Float::INFINITY},
      'condition' => {'type'=>'CodeableConcept', 'path'=>'Specimen.condition', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0493', 'uri'=>nil}},
      'note' => {'type'=>'Annotation', 'path'=>'Specimen.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Collection < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'collected' => ['dateTime', 'Period'],
        'fastingStatus' => ['CodeableConcept', 'Duration']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Collection.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Collection.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Collection.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'collector' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Collection.collector', 'min'=>0, 'max'=>1},
        'collectedDateTime' => {'type'=>'dateTime', 'path'=>'Collection.collected[x]', 'min'=>0, 'max'=>1},
        'collectedPeriod' => {'type'=>'Period', 'path'=>'Collection.collected[x]', 'min'=>0, 'max'=>1},
        'duration' => {'type'=>'Duration', 'path'=>'Collection.duration', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'Collection.quantity', 'min'=>0, 'max'=>1},
        'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'Collection.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/specimen-collection-method', 'uri'=>nil}},
        'bodySite' => {'type'=>'CodeableConcept', 'path'=>'Collection.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
        'fastingStatusCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Collection.fastingStatus[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0916', 'uri'=>nil}},
        'fastingStatusDuration' => {'type'=>'Duration', 'path'=>'Collection.fastingStatus[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                           # 0-1 string
      attr_accessor :extension                    # 0-* [ Extension ]
      attr_accessor :modifierExtension            # 0-* [ Extension ]
      attr_accessor :collector                    # 0-1 Reference(Practitioner|PractitionerRole)
      attr_accessor :collectedDateTime            # 0-1 dateTime
      attr_accessor :collectedPeriod              # 0-1 Period
      attr_accessor :duration                     # 0-1 Duration
      attr_accessor :quantity                     # 0-1 Quantity
      attr_accessor :local_method                 # 0-1 CodeableConcept
      attr_accessor :bodySite                     # 0-1 CodeableConcept
      attr_accessor :fastingStatusCodeableConcept # 0-1 CodeableConcept
      attr_accessor :fastingStatusDuration        # 0-1 Duration
    end

    class Processing < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'time' => ['dateTime', 'Period']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Processing.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Processing.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Processing.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Processing.description', 'min'=>0, 'max'=>1},
        'procedure' => {'type'=>'CodeableConcept', 'path'=>'Processing.procedure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/specimen-processing-procedure', 'uri'=>nil}},
        'additive' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Processing.additive', 'min'=>0, 'max'=>Float::INFINITY},
        'timeDateTime' => {'type'=>'dateTime', 'path'=>'Processing.time[x]', 'min'=>0, 'max'=>1},
        'timePeriod' => {'type'=>'Period', 'path'=>'Processing.time[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :description       # 0-1 string
      attr_accessor :procedure         # 0-1 CodeableConcept
      attr_accessor :additive          # 0-* [ Reference(Substance) ]
      attr_accessor :timeDateTime      # 0-1 dateTime
      attr_accessor :timePeriod        # 0-1 Period
    end

    class Container < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'additive' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Container.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Container.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Container.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Container.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Container.description', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Container.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/specimen-container-type', 'uri'=>nil}},
        'capacity' => {'type'=>'Quantity', 'path'=>'Container.capacity', 'min'=>0, 'max'=>1},
        'specimenQuantity' => {'type'=>'Quantity', 'path'=>'Container.specimenQuantity', 'min'=>0, 'max'=>1},
        'additiveCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Container.additive[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0371', 'uri'=>nil}},
        'additiveReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Container.additive[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                      # 0-1 string
      attr_accessor :extension               # 0-* [ Extension ]
      attr_accessor :modifierExtension       # 0-* [ Extension ]
      attr_accessor :identifier              # 0-* [ Identifier ]
      attr_accessor :description             # 0-1 string
      attr_accessor :type                    # 0-1 CodeableConcept
      attr_accessor :capacity                # 0-1 Quantity
      attr_accessor :specimenQuantity        # 0-1 Quantity
      attr_accessor :additiveCodeableConcept # 0-1 CodeableConcept
      attr_accessor :additiveReference       # 0-1 Reference(Substance)
    end

    attr_accessor :id                  # 0-1 id
    attr_accessor :meta                # 0-1 Meta
    attr_accessor :implicitRules       # 0-1 uri
    attr_accessor :language            # 0-1 code
    attr_accessor :text                # 0-1 Narrative
    attr_accessor :contained           # 0-* [ Resource ]
    attr_accessor :extension           # 0-* [ Extension ]
    attr_accessor :modifierExtension   # 0-* [ Extension ]
    attr_accessor :identifier          # 0-* [ Identifier ]
    attr_accessor :accessionIdentifier # 0-1 Identifier
    attr_accessor :status              # 0-1 code
    attr_accessor :type                # 0-1 CodeableConcept
    attr_accessor :subject             # 0-1 Reference(Patient|Group|Device|Substance|Location)
    attr_accessor :receivedTime        # 0-1 dateTime
    attr_accessor :parent              # 0-* [ Reference(Specimen) ]
    attr_accessor :request             # 0-* [ Reference(ServiceRequest) ]
    attr_accessor :collection          # 0-1 Specimen::Collection
    attr_accessor :processing          # 0-* [ Specimen::Processing ]
    attr_accessor :container           # 0-* [ Specimen::Container ]
    attr_accessor :condition           # 0-* [ CodeableConcept ]
    attr_accessor :note                # 0-* [ Annotation ]

    def resourceType
      'Specimen'
    end
  end
end