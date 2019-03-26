module FHIR
  class Immunization < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'occurrence' => ['dateTime', 'string']
    }
    SEARCH_PARAMS = ['date', 'identifier', 'patient', 'location', 'lot-number', 'manufacturer', 'performer', 'reaction', 'reaction-date', 'reason-code', 'reason-reference', 'series', 'status', 'status-reason', 'target-disease', 'vaccine-code']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Immunization.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Immunization.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Immunization.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Immunization.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Immunization.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Immunization.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Immunization.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Immunization.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Immunization.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Immunization.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-status|4.0.0', 'uri'=>nil}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'Immunization.statusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-status-reason', 'uri'=>nil}},
      'vaccineCode' => {'type'=>'CodeableConcept', 'path'=>'Immunization.vaccineCode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/vaccine-code', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Immunization.patient', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Immunization.encounter', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'Immunization.occurrence[x]', 'min'=>1, 'max'=>1},
      'occurrenceString' => {'type'=>'string', 'path'=>'Immunization.occurrence[x]', 'min'=>1, 'max'=>1},
      'recorded' => {'type'=>'dateTime', 'path'=>'Immunization.recorded', 'min'=>0, 'max'=>1},
      'primarySource' => {'type'=>'boolean', 'path'=>'Immunization.primarySource', 'min'=>0, 'max'=>1},
      'reportOrigin' => {'type'=>'CodeableConcept', 'path'=>'Immunization.reportOrigin', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-origin', 'uri'=>nil}},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Immunization.location', 'min'=>0, 'max'=>1},
      'manufacturer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Immunization.manufacturer', 'min'=>0, 'max'=>1},
      'lotNumber' => {'type'=>'string', 'path'=>'Immunization.lotNumber', 'min'=>0, 'max'=>1},
      'expirationDate' => {'type'=>'date', 'path'=>'Immunization.expirationDate', 'min'=>0, 'max'=>1},
      'site' => {'type'=>'CodeableConcept', 'path'=>'Immunization.site', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-site', 'uri'=>nil}},
      'route' => {'type'=>'CodeableConcept', 'path'=>'Immunization.route', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-route', 'uri'=>nil}},
      'doseQuantity' => {'type'=>'Quantity', 'path'=>'Immunization.doseQuantity', 'min'=>0, 'max'=>1},
      'performer' => {'type'=>'Immunization::Performer', 'path'=>'Immunization.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'Immunization.note', 'min'=>0, 'max'=>Float::INFINITY},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'Immunization.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-reason', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport'], 'type'=>'Reference', 'path'=>'Immunization.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'isSubpotent' => {'type'=>'boolean', 'path'=>'Immunization.isSubpotent', 'min'=>0, 'max'=>1},
      'subpotentReason' => {'type'=>'CodeableConcept', 'path'=>'Immunization.subpotentReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-subpotent-reason', 'uri'=>nil}},
      'education' => {'type'=>'Immunization::Education', 'path'=>'Immunization.education', 'min'=>0, 'max'=>Float::INFINITY},
      'programEligibility' => {'type'=>'CodeableConcept', 'path'=>'Immunization.programEligibility', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-program-eligibility', 'uri'=>nil}},
      'fundingSource' => {'type'=>'CodeableConcept', 'path'=>'Immunization.fundingSource', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-funding-source', 'uri'=>nil}},
      'reaction' => {'type'=>'Immunization::Reaction', 'path'=>'Immunization.reaction', 'min'=>0, 'max'=>Float::INFINITY},
      'protocolApplied' => {'type'=>'Immunization::ProtocolApplied', 'path'=>'Immunization.protocolApplied', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Performer < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'function' => {'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-function', 'uri'=>nil}},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :function          # 0-1 CodeableConcept
      attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization)
    end

    class Education < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Education.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Education.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Education.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'documentType' => {'type'=>'string', 'path'=>'Education.documentType', 'min'=>0, 'max'=>1},
        'reference' => {'type'=>'uri', 'path'=>'Education.reference', 'min'=>0, 'max'=>1},
        'publicationDate' => {'type'=>'dateTime', 'path'=>'Education.publicationDate', 'min'=>0, 'max'=>1},
        'presentationDate' => {'type'=>'dateTime', 'path'=>'Education.presentationDate', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :documentType      # 0-1 string
      attr_accessor :reference         # 0-1 uri
      attr_accessor :publicationDate   # 0-1 dateTime
      attr_accessor :presentationDate  # 0-1 dateTime
    end

    class Reaction < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Reaction.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Reaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Reaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'date' => {'type'=>'dateTime', 'path'=>'Reaction.date', 'min'=>0, 'max'=>1},
        'detail' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Reaction.detail', 'min'=>0, 'max'=>1},
        'reported' => {'type'=>'boolean', 'path'=>'Reaction.reported', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :date              # 0-1 dateTime
      attr_accessor :detail            # 0-1 Reference(Observation)
      attr_accessor :reported          # 0-1 boolean
    end

    class ProtocolApplied < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'doseNumber' => ['positiveInt', 'string'],
        'seriesDoses' => ['positiveInt', 'string']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ProtocolApplied.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ProtocolApplied.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ProtocolApplied.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'series' => {'type'=>'string', 'path'=>'ProtocolApplied.series', 'min'=>0, 'max'=>1},
        'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ProtocolApplied.authority', 'min'=>0, 'max'=>1},
        'targetDisease' => {'type'=>'CodeableConcept', 'path'=>'ProtocolApplied.targetDisease', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/immunization-target-disease', 'uri'=>nil}},
        'doseNumberPositiveInt' => {'type'=>'positiveInt', 'path'=>'ProtocolApplied.doseNumber[x]', 'min'=>1, 'max'=>1},
        'doseNumberString' => {'type'=>'string', 'path'=>'ProtocolApplied.doseNumber[x]', 'min'=>1, 'max'=>1},
        'seriesDosesPositiveInt' => {'type'=>'positiveInt', 'path'=>'ProtocolApplied.seriesDoses[x]', 'min'=>0, 'max'=>1},
        'seriesDosesString' => {'type'=>'string', 'path'=>'ProtocolApplied.seriesDoses[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                     # 0-1 string
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :series                 # 0-1 string
      attr_accessor :authority              # 0-1 Reference(Organization)
      attr_accessor :targetDisease          # 0-* [ CodeableConcept ]
      attr_accessor :doseNumberPositiveInt  # 1-1 positiveInt
      attr_accessor :doseNumberString       # 1-1 string
      attr_accessor :seriesDosesPositiveInt # 0-1 positiveInt
      attr_accessor :seriesDosesString      # 0-1 string
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
    attr_accessor :status             # 1-1 code
    attr_accessor :statusReason       # 0-1 CodeableConcept
    attr_accessor :vaccineCode        # 1-1 CodeableConcept
    attr_accessor :patient            # 1-1 Reference(Patient)
    attr_accessor :encounter          # 0-1 Reference(Encounter)
    attr_accessor :occurrenceDateTime # 1-1 dateTime
    attr_accessor :occurrenceString   # 1-1 string
    attr_accessor :recorded           # 0-1 dateTime
    attr_accessor :primarySource      # 0-1 boolean
    attr_accessor :reportOrigin       # 0-1 CodeableConcept
    attr_accessor :location           # 0-1 Reference(Location)
    attr_accessor :manufacturer       # 0-1 Reference(Organization)
    attr_accessor :lotNumber          # 0-1 string
    attr_accessor :expirationDate     # 0-1 date
    attr_accessor :site               # 0-1 CodeableConcept
    attr_accessor :route              # 0-1 CodeableConcept
    attr_accessor :doseQuantity       # 0-1 Quantity
    attr_accessor :performer          # 0-* [ Immunization::Performer ]
    attr_accessor :note               # 0-* [ Annotation ]
    attr_accessor :reasonCode         # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference    # 0-* [ Reference(Condition|Observation|DiagnosticReport) ]
    attr_accessor :isSubpotent        # 0-1 boolean
    attr_accessor :subpotentReason    # 0-* [ CodeableConcept ]
    attr_accessor :education          # 0-* [ Immunization::Education ]
    attr_accessor :programEligibility # 0-* [ CodeableConcept ]
    attr_accessor :fundingSource      # 0-1 CodeableConcept
    attr_accessor :reaction           # 0-* [ Immunization::Reaction ]
    attr_accessor :protocolApplied    # 0-* [ Immunization::ProtocolApplied ]

    def resourceType
      'Immunization'
    end
  end
end