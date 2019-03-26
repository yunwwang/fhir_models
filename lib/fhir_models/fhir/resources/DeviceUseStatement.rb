module FHIR
  class DeviceUseStatement < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'timing' => ['Timing', 'Period', 'dateTime']
    }
    SEARCH_PARAMS = ['patient', 'device', 'identifier', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DeviceUseStatement.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DeviceUseStatement.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DeviceUseStatement.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DeviceUseStatement.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'DeviceUseStatement.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DeviceUseStatement.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DeviceUseStatement.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceUseStatement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'DeviceUseStatement.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'DeviceUseStatement.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'DeviceUseStatement.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-statement-status|4.0.0', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'DeviceUseStatement.subject', 'min'=>1, 'max'=>1},
      'derivedFrom' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Claim', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'DeviceUseStatement.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
      'timingTiming' => {'type'=>'Timing', 'path'=>'DeviceUseStatement.timing[x]', 'min'=>0, 'max'=>1},
      'timingPeriod' => {'type'=>'Period', 'path'=>'DeviceUseStatement.timing[x]', 'min'=>0, 'max'=>1},
      'timingDateTime' => {'type'=>'dateTime', 'path'=>'DeviceUseStatement.timing[x]', 'min'=>0, 'max'=>1},
      'recordedOn' => {'type'=>'dateTime', 'path'=>'DeviceUseStatement.recordedOn', 'min'=>0, 'max'=>1},
      'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'DeviceUseStatement.source', 'min'=>0, 'max'=>1},
      'device' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DeviceUseStatement.device', 'min'=>1, 'max'=>1},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'DeviceUseStatement.reasonCode', 'min'=>0, 'max'=>Float::INFINITY},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/Media'], 'type'=>'Reference', 'path'=>'DeviceUseStatement.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'bodySite' => {'type'=>'CodeableConcept', 'path'=>'DeviceUseStatement.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'note' => {'type'=>'Annotation', 'path'=>'DeviceUseStatement.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :basedOn           # 0-* [ Reference(ServiceRequest) ]
    attr_accessor :status            # 1-1 code
    attr_accessor :subject           # 1-1 Reference(Patient|Group)
    attr_accessor :derivedFrom       # 0-* [ Reference(ServiceRequest|Procedure|Claim|Observation|QuestionnaireResponse|DocumentReference) ]
    attr_accessor :timingTiming      # 0-1 Timing
    attr_accessor :timingPeriod      # 0-1 Period
    attr_accessor :timingDateTime    # 0-1 dateTime
    attr_accessor :recordedOn        # 0-1 dateTime
    attr_accessor :source            # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson)
    attr_accessor :device            # 1-1 Reference(Device)
    attr_accessor :reasonCode        # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference   # 0-* [ Reference(Condition|Observation|DiagnosticReport|DocumentReference|Media) ]
    attr_accessor :bodySite          # 0-1 CodeableConcept
    attr_accessor :note              # 0-* [ Annotation ]

    def resourceType
      'DeviceUseStatement'
    end
  end
end