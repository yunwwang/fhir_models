module FHIR
  class MedicationStatement < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'medication' => ['CodeableConcept', 'Reference'],
      'effective' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ['code', 'identifier', 'patient', 'medication', 'status', 'category', 'context', 'effective', 'part-of', 'source', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicationStatement.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicationStatement.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicationStatement.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MedicationStatement.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicationStatement.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicationStatement.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicationStatement.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationStatement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'MedicationStatement.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'MedicationStatement.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationAdministration', 'http://hl7.org/fhir/StructureDefinition/MedicationDispense', 'http://hl7.org/fhir/StructureDefinition/MedicationStatement', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'MedicationStatement.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'MedicationStatement.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-statement-status|4.0.0', 'uri'=>nil}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'MedicationStatement.statusReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/reason-medication-status-codes', 'uri'=>nil}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'MedicationStatement.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-statement-category', 'uri'=>nil}},
      'medicationCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'MedicationStatement.medication[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-codes', 'uri'=>nil}},
      'medicationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicationStatement.medication[x]', 'min'=>1, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationStatement.subject', 'min'=>1, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'MedicationStatement.context', 'min'=>0, 'max'=>1},
      'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'MedicationStatement.effective[x]', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'MedicationStatement.effective[x]', 'min'=>0, 'max'=>1},
      'dateAsserted' => {'type'=>'dateTime', 'path'=>'MedicationStatement.dateAsserted', 'min'=>0, 'max'=>1},
      'informationSource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'MedicationStatement.informationSource', 'min'=>0, 'max'=>1},
      'derivedFrom' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationStatement.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
      'reasonCode' => {'type'=>'CodeableConcept', 'path'=>'MedicationStatement.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/condition-code', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport'], 'type'=>'Reference', 'path'=>'MedicationStatement.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'MedicationStatement.note', 'min'=>0, 'max'=>Float::INFINITY},
      'dosage' => {'type'=>'Dosage', 'path'=>'MedicationStatement.dosage', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                        # 0-1 id
    attr_accessor :meta                      # 0-1 Meta
    attr_accessor :implicitRules             # 0-1 uri
    attr_accessor :language                  # 0-1 code
    attr_accessor :text                      # 0-1 Narrative
    attr_accessor :contained                 # 0-* [ Resource ]
    attr_accessor :extension                 # 0-* [ Extension ]
    attr_accessor :modifierExtension         # 0-* [ Extension ]
    attr_accessor :identifier                # 0-* [ Identifier ]
    attr_accessor :basedOn                   # 0-* [ Reference(MedicationRequest|CarePlan|ServiceRequest) ]
    attr_accessor :partOf                    # 0-* [ Reference(MedicationAdministration|MedicationDispense|MedicationStatement|Procedure|Observation) ]
    attr_accessor :status                    # 1-1 code
    attr_accessor :statusReason              # 0-* [ CodeableConcept ]
    attr_accessor :category                  # 0-1 CodeableConcept
    attr_accessor :medicationCodeableConcept # 1-1 CodeableConcept
    attr_accessor :medicationReference       # 1-1 Reference(Medication)
    attr_accessor :subject                   # 1-1 Reference(Patient|Group)
    attr_accessor :context                   # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :effectiveDateTime         # 0-1 dateTime
    attr_accessor :effectivePeriod           # 0-1 Period
    attr_accessor :dateAsserted              # 0-1 dateTime
    attr_accessor :informationSource         # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Organization)
    attr_accessor :derivedFrom               # 0-* [ Reference(Resource) ]
    attr_accessor :reasonCode                # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference           # 0-* [ Reference(Condition|Observation|DiagnosticReport) ]
    attr_accessor :note                      # 0-* [ Annotation ]
    attr_accessor :dosage                    # 0-* [ Dosage ]

    def resourceType
      'MedicationStatement'
    end
  end
end