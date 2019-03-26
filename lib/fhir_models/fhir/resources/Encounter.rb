module FHIR
  class Encounter < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'identifier', 'patient', 'type', 'account', 'appointment', 'based-on', 'class', 'diagnosis', 'episode-of-care', 'length', 'location', 'location-period', 'part-of', 'participant', 'participant-type', 'practitioner', 'reason-code', 'reason-reference', 'service-provider', 'special-arrangement', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Encounter.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Encounter.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Encounter.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Encounter.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Encounter.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Encounter.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Encounter.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Encounter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Encounter.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Encounter.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-status|4.0.0', 'uri'=>nil}},
      'statusHistory' => {'type'=>'Encounter::StatusHistory', 'path'=>'Encounter.statusHistory', 'min'=>0, 'max'=>Float::INFINITY},
      'class' => {'local_name'=>'local_class', 'type'=>'Coding', 'path'=>'Encounter.class', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActEncounterCode', 'uri'=>nil}},
      'classHistory' => {'type'=>'Encounter::ClassHistory', 'path'=>'Encounter.classHistory', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'type'=>'CodeableConcept', 'path'=>'Encounter.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-type', 'uri'=>nil}},
      'serviceType' => {'type'=>'CodeableConcept', 'path'=>'Encounter.serviceType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-type', 'uri'=>nil}},
      'priority' => {'type'=>'CodeableConcept', 'path'=>'Encounter.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActPriority', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Encounter.subject', 'min'=>0, 'max'=>1},
      'episodeOfCare' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'Encounter.episodeOfCare', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'Encounter.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'participant' => {'type'=>'Encounter::Participant', 'path'=>'Encounter.participant', 'min'=>0, 'max'=>Float::INFINITY},
      'appointment' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Appointment'], 'type'=>'Reference', 'path'=>'Encounter.appointment', 'min'=>0, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'Encounter.period', 'min'=>0, 'max'=>1},
      'length' => {'type'=>'Duration', 'path'=>'Encounter.length', 'min'=>0, 'max'=>1},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'Encounter.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-reason', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation'], 'type'=>'Reference', 'path'=>'Encounter.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'diagnosis' => {'type'=>'Encounter::Diagnosis', 'path'=>'Encounter.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
      'account' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Account'], 'type'=>'Reference', 'path'=>'Encounter.account', 'min'=>0, 'max'=>Float::INFINITY},
      'hospitalization' => {'type'=>'Encounter::Hospitalization', 'path'=>'Encounter.hospitalization', 'min'=>0, 'max'=>1},
      'location' => {'type'=>'Encounter::Location', 'path'=>'Encounter.location', 'min'=>0, 'max'=>Float::INFINITY},
      'serviceProvider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Encounter.serviceProvider', 'min'=>0, 'max'=>1},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Encounter.partOf', 'min'=>0, 'max'=>1}
    }

    class StatusHistory < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'StatusHistory.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'StatusHistory.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'StatusHistory.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'type'=>'code', 'path'=>'StatusHistory.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-status|4.0.0', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'StatusHistory.period', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :status            # 1-1 code
      attr_accessor :period            # 1-1 Period
    end

    class ClassHistory < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ClassHistory.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ClassHistory.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ClassHistory.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'class' => {'local_name'=>'local_class', 'type'=>'Coding', 'path'=>'ClassHistory.class', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActEncounterCode', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'ClassHistory.period', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :local_class       # 1-1 Coding
      attr_accessor :period            # 1-1 Period
    end

    class Participant < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Participant.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Participant.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Participant.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Participant.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-participant-type', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'Participant.period', 'min'=>0, 'max'=>1},
        'individual' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Participant.individual', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-* [ CodeableConcept ]
      attr_accessor :period            # 0-1 Period
      attr_accessor :individual        # 0-1 Reference(Practitioner|PractitionerRole|RelatedPerson)
    end

    class Diagnosis < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Diagnosis.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Diagnosis.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Diagnosis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'condition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'Diagnosis.condition', 'min'=>1, 'max'=>1},
        'use' => {'type'=>'CodeableConcept', 'path'=>'Diagnosis.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/diagnosis-role', 'uri'=>nil}},
        'rank' => {'type'=>'positiveInt', 'path'=>'Diagnosis.rank', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :condition         # 1-1 Reference(Condition|Procedure)
      attr_accessor :use               # 0-1 CodeableConcept
      attr_accessor :rank              # 0-1 positiveInt
    end

    class Hospitalization < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Hospitalization.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Hospitalization.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Hospitalization.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'preAdmissionIdentifier' => {'type'=>'Identifier', 'path'=>'Hospitalization.preAdmissionIdentifier', 'min'=>0, 'max'=>1},
        'origin' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Hospitalization.origin', 'min'=>0, 'max'=>1},
        'admitSource' => {'type'=>'CodeableConcept', 'path'=>'Hospitalization.admitSource', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-admit-source', 'uri'=>nil}},
        'reAdmission' => {'type'=>'CodeableConcept', 'path'=>'Hospitalization.reAdmission', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v2-0092', 'uri'=>nil}},
        'dietPreference' => {'type'=>'CodeableConcept', 'path'=>'Hospitalization.dietPreference', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-diet', 'uri'=>nil}},
        'specialCourtesy' => {'type'=>'CodeableConcept', 'path'=>'Hospitalization.specialCourtesy', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-special-courtesy', 'uri'=>nil}},
        'specialArrangement' => {'type'=>'CodeableConcept', 'path'=>'Hospitalization.specialArrangement', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-special-arrangements', 'uri'=>nil}},
        'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Hospitalization.destination', 'min'=>0, 'max'=>1},
        'dischargeDisposition' => {'type'=>'CodeableConcept', 'path'=>'Hospitalization.dischargeDisposition', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-discharge-disposition', 'uri'=>nil}}
      }

      attr_accessor :id                     # 0-1 string
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :preAdmissionIdentifier # 0-1 Identifier
      attr_accessor :origin                 # 0-1 Reference(Location|Organization)
      attr_accessor :admitSource            # 0-1 CodeableConcept
      attr_accessor :reAdmission            # 0-1 CodeableConcept
      attr_accessor :dietPreference         # 0-* [ CodeableConcept ]
      attr_accessor :specialCourtesy        # 0-* [ CodeableConcept ]
      attr_accessor :specialArrangement     # 0-* [ CodeableConcept ]
      attr_accessor :destination            # 0-1 Reference(Location|Organization)
      attr_accessor :dischargeDisposition   # 0-1 CodeableConcept
    end

    class Location < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Location.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Location.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Location.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Location.location', 'min'=>1, 'max'=>1},
        'status' => {'type'=>'code', 'path'=>'Location.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/encounter-location-status|4.0.0', 'uri'=>nil}},
        'physicalType' => {'type'=>'CodeableConcept', 'path'=>'Location.physicalType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/location-physical-type', 'uri'=>nil}},
        'period' => {'type'=>'Period', 'path'=>'Location.period', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :location          # 1-1 Reference(Location)
      attr_accessor :status            # 0-1 code
      attr_accessor :physicalType      # 0-1 CodeableConcept
      attr_accessor :period            # 0-1 Period
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
    attr_accessor :status            # 1-1 code
    attr_accessor :statusHistory     # 0-* [ Encounter::StatusHistory ]
    attr_accessor :local_class       # 1-1 Coding
    attr_accessor :classHistory      # 0-* [ Encounter::ClassHistory ]
    attr_accessor :type              # 0-* [ CodeableConcept ]
    attr_accessor :serviceType       # 0-1 CodeableConcept
    attr_accessor :priority          # 0-1 CodeableConcept
    attr_accessor :subject           # 0-1 Reference(Patient|Group)
    attr_accessor :episodeOfCare     # 0-* [ Reference(EpisodeOfCare) ]
    attr_accessor :basedOn           # 0-* [ Reference(ServiceRequest) ]
    attr_accessor :participant       # 0-* [ Encounter::Participant ]
    attr_accessor :appointment       # 0-* [ Reference(Appointment) ]
    attr_accessor :period            # 0-1 Period
    attr_accessor :length            # 0-1 Duration
    attr_accessor :reasonCode        # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference   # 0-* [ Reference(Condition|Procedure|Observation|ImmunizationRecommendation) ]
    attr_accessor :diagnosis         # 0-* [ Encounter::Diagnosis ]
    attr_accessor :account           # 0-* [ Reference(Account) ]
    attr_accessor :hospitalization   # 0-1 Encounter::Hospitalization
    attr_accessor :location          # 0-* [ Encounter::Location ]
    attr_accessor :serviceProvider   # 0-1 Reference(Organization)
    attr_accessor :partOf            # 0-1 Reference(Encounter)

    def resourceType
      'Encounter'
    end
  end
end