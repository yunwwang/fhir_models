module FHIR
  class MedicationAdministration < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'medication' => ['CodeableConcept', 'Reference'],
      'effective' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ['code', 'identifier', 'patient', 'context', 'device', 'effective-time', 'medication', 'performer', 'reason-given', 'reason-not-given', 'request', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicationAdministration.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicationAdministration.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicationAdministration.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MedicationAdministration.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicationAdministration.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicationAdministration.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicationAdministration.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationAdministration.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'MedicationAdministration.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'instantiates' => {'type'=>'uri', 'path'=>'MedicationAdministration.instantiates', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationAdministration', 'http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'MedicationAdministration.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'MedicationAdministration.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-admin-status|4.0.0', 'uri'=>nil}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'MedicationAdministration.statusReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/reason-medication-not-given-codes', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'MedicationAdministration.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-admin-category', 'uri'=>nil}},
      'medicationCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'MedicationAdministration.medication[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-codes', 'uri'=>nil}},
      'medicationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicationAdministration.medication[x]', 'min'=>1, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationAdministration.subject', 'min'=>1, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'MedicationAdministration.context', 'min'=>0, 'max'=>1},
      'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationAdministration.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
      'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'MedicationAdministration.effective[x]', 'min'=>1, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'MedicationAdministration.effective[x]', 'min'=>1, 'max'=>1},
      'performer' => {'type'=>'MedicationAdministration::Performer', 'path'=>'MedicationAdministration.performer', 'min'=>0, 'max'=>Float::INFINITY},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'MedicationAdministration.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/reason-medication-given-codes', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport'], 'type'=>'Reference', 'path'=>'MedicationAdministration.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'MedicationAdministration.request', 'min'=>0, 'max'=>1},
      'device' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'MedicationAdministration.device', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'MedicationAdministration.note', 'min'=>0, 'max'=>Float::INFINITY},
      'dosage' => {'type'=>'MedicationAdministration::Dosage', 'path'=>'MedicationAdministration.dosage', 'min'=>0, 'max'=>1},
      'eventHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'MedicationAdministration.eventHistory', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Performer < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'function' => {'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/med-admin-perform-function', 'uri'=>nil}},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :function          # 0-1 CodeableConcept
      attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Patient|RelatedPerson|Device)
    end

    class Dosage < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'rate' => ['Ratio', 'Quantity']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Dosage.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Dosage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Dosage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'text' => {'type'=>'string', 'path'=>'Dosage.text', 'min'=>0, 'max'=>1},
        'site' => {'type'=>'CodeableConcept', 'path'=>'Dosage.site', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/approach-site-codes', 'uri'=>nil}},
        'route' => {'type'=>'CodeableConcept', 'path'=>'Dosage.route', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/route-codes', 'uri'=>nil}},
        'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'Dosage.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/administration-method-codes', 'uri'=>nil}},
        'dose' => {'type'=>'Quantity', 'path'=>'Dosage.dose', 'min'=>0, 'max'=>1},
        'rateRatio' => {'type'=>'Ratio', 'path'=>'Dosage.rate[x]', 'min'=>0, 'max'=>1},
        'rateQuantity' => {'type'=>'Quantity', 'path'=>'Dosage.rate[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :text              # 0-1 string
      attr_accessor :site              # 0-1 CodeableConcept
      attr_accessor :route             # 0-1 CodeableConcept
      attr_accessor :local_method      # 0-1 CodeableConcept
      attr_accessor :dose              # 0-1 Quantity
      attr_accessor :rateRatio         # 0-1 Ratio
      attr_accessor :rateQuantity      # 0-1 Quantity
    end

    attr_accessor :id                        # 0-1 id
    attr_accessor :meta                      # 0-1 Meta
    attr_accessor :implicitRules             # 0-1 uri
    attr_accessor :language                  # 0-1 code
    attr_accessor :text                      # 0-1 Narrative
    attr_accessor :contained                 # 0-* [ Resource ]
    attr_accessor :extension                 # 0-* [ Extension ]
    attr_accessor :modifierExtension         # 0-* [ Extension ]
    attr_accessor :identifier                # 0-* [ Identifier ]
    attr_accessor :instantiates              # 0-* [ uri ]
    attr_accessor :partOf                    # 0-* [ Reference(MedicationAdministration|Procedure) ]
    attr_accessor :status                    # 1-1 code
    attr_accessor :statusReason              # 0-* [ CodeableConcept ]
    attr_accessor :category                  # 0-1 CodeableConcept
    attr_accessor :medicationCodeableConcept # 1-1 CodeableConcept
    attr_accessor :medicationReference       # 1-1 Reference(Medication)
    attr_accessor :subject                   # 1-1 Reference(Patient|Group)
    attr_accessor :context                   # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :supportingInformation     # 0-* [ Reference(Resource) ]
    attr_accessor :effectiveDateTime         # 1-1 dateTime
    attr_accessor :effectivePeriod           # 1-1 Period
    attr_accessor :performer                 # 0-* [ MedicationAdministration::Performer ]
    attr_accessor :reasonCode                # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference           # 0-* [ Reference(Condition|Observation|DiagnosticReport) ]
    attr_accessor :request                   # 0-1 Reference(MedicationRequest)
    attr_accessor :device                    # 0-* [ Reference(Device) ]
    attr_accessor :note                      # 0-* [ Annotation ]
    attr_accessor :dosage                    # 0-1 MedicationAdministration::Dosage
    attr_accessor :eventHistory              # 0-* [ Reference(Provenance) ]

    def resourceType
      'MedicationAdministration'
    end
  end
end