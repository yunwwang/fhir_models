module FHIR
  class Media < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'created' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ['based-on', 'created', 'device', 'encounter', 'identifier', 'modality', 'operator', 'patient', 'site', 'status', 'subject', 'type', 'view']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Media.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Media.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Media.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Media.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Media.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Media.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Media.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Media.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Media.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/CarePlan'], 'type'=>'Reference', 'path'=>'Media.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Media.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Media.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/event-status|4.0.0', 'uri'=>nil}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'Media.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/media-type', 'uri'=>nil}},
      'modality' => {'type'=>'CodeableConcept', 'path'=>'Media.modality', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/media-modality', 'uri'=>nil}},
      'view' => {'type'=>'CodeableConcept', 'path'=>'Media.view', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/media-view', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Specimen', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Media.subject', 'min'=>0, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Media.encounter', 'min'=>0, 'max'=>1},
      'createdDateTime' => {'type'=>'dateTime', 'path'=>'Media.created[x]', 'min'=>0, 'max'=>1},
      'createdPeriod' => {'type'=>'Period', 'path'=>'Media.created[x]', 'min'=>0, 'max'=>1},
      'issued' => {'type'=>'instant', 'path'=>'Media.issued', 'min'=>0, 'max'=>1},
      'operator' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Media.operator', 'min'=>0, 'max'=>1},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'Media.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-reason', 'uri'=>nil}},
      'bodySite' => {'type'=>'CodeableConcept', 'path'=>'Media.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'deviceName' => {'type'=>'string', 'path'=>'Media.deviceName', 'min'=>0, 'max'=>1},
      'device' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/DeviceMetric', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Media.device', 'min'=>0, 'max'=>1},
      'height' => {'type'=>'positiveInt', 'path'=>'Media.height', 'min'=>0, 'max'=>1},
      'width' => {'type'=>'positiveInt', 'path'=>'Media.width', 'min'=>0, 'max'=>1},
      'frames' => {'type'=>'positiveInt', 'path'=>'Media.frames', 'min'=>0, 'max'=>1},
      'duration' => {'type'=>'decimal', 'path'=>'Media.duration', 'min'=>0, 'max'=>1},
      'content' => {'type'=>'Attachment', 'path'=>'Media.content', 'min'=>1, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'Media.note', 'min'=>0, 'max'=>Float::INFINITY}
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
    attr_accessor :basedOn           # 0-* [ Reference(ServiceRequest|CarePlan) ]
    attr_accessor :partOf            # 0-* [ Reference(Resource) ]
    attr_accessor :status            # 1-1 code
    attr_accessor :type              # 0-1 CodeableConcept
    attr_accessor :modality          # 0-1 CodeableConcept
    attr_accessor :view              # 0-1 CodeableConcept
    attr_accessor :subject           # 0-1 Reference(Patient|Practitioner|PractitionerRole|Group|Device|Specimen|Location)
    attr_accessor :encounter         # 0-1 Reference(Encounter)
    attr_accessor :createdDateTime   # 0-1 dateTime
    attr_accessor :createdPeriod     # 0-1 Period
    attr_accessor :issued            # 0-1 instant
    attr_accessor :operator          # 0-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|Device|RelatedPerson)
    attr_accessor :reasonCode        # 0-* [ CodeableConcept ]
    attr_accessor :bodySite          # 0-1 CodeableConcept
    attr_accessor :deviceName        # 0-1 string
    attr_accessor :device            # 0-1 Reference(Device|DeviceMetric|Device)
    attr_accessor :height            # 0-1 positiveInt
    attr_accessor :width             # 0-1 positiveInt
    attr_accessor :frames            # 0-1 positiveInt
    attr_accessor :duration          # 0-1 decimal
    attr_accessor :content           # 1-1 Attachment
    attr_accessor :note              # 0-* [ Annotation ]

    def resourceType
      'Media'
    end
  end
end