module FHIR
  class Procedure < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'performed' => ['dateTime', 'Period', 'string', 'Age', 'Range']
    }
    SEARCH_PARAMS = ['code', 'date', 'identifier', 'patient', 'encounter', 'based-on', 'category', 'instantiates-canonical', 'instantiates-uri', 'location', 'part-of', 'performer', 'reason-code', 'reason-reference', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Procedure.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Procedure.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Procedure.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Procedure.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Procedure.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Procedure.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Procedure.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Procedure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Procedure.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'Procedure.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiatesUri' => {'type'=>'uri', 'path'=>'Procedure.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'Procedure.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/MedicationAdministration'], 'type'=>'Reference', 'path'=>'Procedure.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Procedure.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/event-status|4.0.0', 'uri'=>nil}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'Procedure.statusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-not-performed-reason', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'Procedure.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-category', 'uri'=>nil}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'Procedure.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-code', 'uri'=>nil}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Procedure.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Procedure.encounter', 'min'=>0, 'max'=>1},
      'performedDateTime' => {'type'=>'dateTime', 'path'=>'Procedure.performed[x]', 'min'=>0, 'max'=>1},
      'performedPeriod' => {'type'=>'Period', 'path'=>'Procedure.performed[x]', 'min'=>0, 'max'=>1},
      'performedString' => {'type'=>'string', 'path'=>'Procedure.performed[x]', 'min'=>0, 'max'=>1},
      'performedAge' => {'type'=>'Age', 'path'=>'Procedure.performed[x]', 'min'=>0, 'max'=>1},
      'performedRange' => {'type'=>'Range', 'path'=>'Procedure.performed[x]', 'min'=>0, 'max'=>1},
      'recorder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Procedure.recorder', 'min'=>0, 'max'=>1},
      'asserter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Procedure.asserter', 'min'=>0, 'max'=>1},
      'performer' => {'type'=>'Procedure::Performer', 'path'=>'Procedure.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Procedure.location', 'min'=>0, 'max'=>1},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'Procedure.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-reason', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'Procedure.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'bodySite' => {'type'=>'CodeableConcept', 'path'=>'Procedure.bodySite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/body-site', 'uri'=>nil}},
      'outcome' => {'type'=>'CodeableConcept', 'path'=>'Procedure.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-outcome', 'uri'=>nil}},
      'report' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/Composition'], 'type'=>'Reference', 'path'=>'Procedure.report', 'min'=>0, 'max'=>Float::INFINITY},
      'complication' => {'type'=>'CodeableConcept', 'path'=>'Procedure.complication', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
      'complicationDetail' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'Procedure.complicationDetail', 'min'=>0, 'max'=>Float::INFINITY},
      'followUp' => {'type'=>'CodeableConcept', 'path'=>'Procedure.followUp', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/procedure-followup', 'uri'=>nil}},
      'note' => {'type'=>'Annotation', 'path'=>'Procedure.note', 'min'=>0, 'max'=>Float::INFINITY},
      'focalDevice' => {'type'=>'Procedure::FocalDevice', 'path'=>'Procedure.focalDevice', 'min'=>0, 'max'=>Float::INFINITY},
      'usedReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Procedure.usedReference', 'min'=>0, 'max'=>Float::INFINITY},
      'usedCode' => {'type'=>'CodeableConcept', 'path'=>'Procedure.usedCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-kind', 'uri'=>nil}}
    }

    class Performer < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'function' => {'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/performer-role', 'uri'=>nil}},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1},
        'onBehalfOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Performer.onBehalfOf', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :function          # 0-1 CodeableConcept
      attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson|Device)
      attr_accessor :onBehalfOf        # 0-1 Reference(Organization)
    end

    class FocalDevice < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'FocalDevice.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'FocalDevice.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'FocalDevice.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'action' => {'type'=>'CodeableConcept', 'path'=>'FocalDevice.action', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/device-action', 'uri'=>nil}},
        'manipulated' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'FocalDevice.manipulated', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :action            # 0-1 CodeableConcept
      attr_accessor :manipulated       # 1-1 Reference(Device)
    end

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :identifier            # 0-* [ Identifier ]
    attr_accessor :instantiatesCanonical # 0-* [ canonical ]
    attr_accessor :instantiatesUri       # 0-* [ uri ]
    attr_accessor :basedOn               # 0-* [ Reference(CarePlan|ServiceRequest) ]
    attr_accessor :partOf                # 0-* [ Reference(Procedure|Observation|MedicationAdministration) ]
    attr_accessor :status                # 1-1 code
    attr_accessor :statusReason          # 0-1 CodeableConcept
    attr_accessor :category              # 0-1 CodeableConcept
    attr_accessor :code                  # 0-1 CodeableConcept
    attr_accessor :subject               # 1-1 Reference(Patient|Group)
    attr_accessor :encounter             # 0-1 Reference(Encounter)
    attr_accessor :performedDateTime     # 0-1 dateTime
    attr_accessor :performedPeriod       # 0-1 Period
    attr_accessor :performedString       # 0-1 string
    attr_accessor :performedAge          # 0-1 Age
    attr_accessor :performedRange        # 0-1 Range
    attr_accessor :recorder              # 0-1 Reference(Patient|RelatedPerson|Practitioner|PractitionerRole)
    attr_accessor :asserter              # 0-1 Reference(Patient|RelatedPerson|Practitioner|PractitionerRole)
    attr_accessor :performer             # 0-* [ Procedure::Performer ]
    attr_accessor :location              # 0-1 Reference(Location)
    attr_accessor :reasonCode            # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference       # 0-* [ Reference(Condition|Observation|Procedure|DiagnosticReport|DocumentReference) ]
    attr_accessor :bodySite              # 0-* [ CodeableConcept ]
    attr_accessor :outcome               # 0-1 CodeableConcept
    attr_accessor :report                # 0-* [ Reference(DiagnosticReport|DocumentReference|Composition) ]
    attr_accessor :complication          # 0-* [ CodeableConcept ]
    attr_accessor :complicationDetail    # 0-* [ Reference(Condition) ]
    attr_accessor :followUp              # 0-* [ CodeableConcept ]
    attr_accessor :note                  # 0-* [ Annotation ]
    attr_accessor :focalDevice           # 0-* [ Procedure::FocalDevice ]
    attr_accessor :usedReference         # 0-* [ Reference(Device|Medication|Substance) ]
    attr_accessor :usedCode              # 0-* [ CodeableConcept ]

    def resourceType
      'Procedure'
    end
  end
end