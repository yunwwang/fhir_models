module FHIR
  class ExplanationOfBenefit < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['care-team', 'claim', 'coverage', 'created', 'detail-udi', 'disposition', 'encounter', 'enterer', 'facility', 'identifier', 'item-udi', 'patient', 'payee', 'procedure-udi', 'provider', 'status', 'subdetail-udi']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ExplanationOfBenefit.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ExplanationOfBenefit.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ExplanationOfBenefit.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ExplanationOfBenefit.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ExplanationOfBenefit.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ExplanationOfBenefit.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ExplanationOfBenefit.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ExplanationOfBenefit.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ExplanationOfBenefit.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'ExplanationOfBenefit.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/explanationofbenefit-status|4.0.0', 'uri'=>nil}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'ExplanationOfBenefit.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-type', 'uri'=>nil}},
      'subType' => {'type'=>'CodeableConcept', 'path'=>'ExplanationOfBenefit.subType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-subtype', 'uri'=>nil}},
      'use' => {'type'=>'code', 'path'=>'ExplanationOfBenefit.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-use|4.0.0', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.patient', 'min'=>1, 'max'=>1},
      'billablePeriod' => {'type'=>'Period', 'path'=>'ExplanationOfBenefit.billablePeriod', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'ExplanationOfBenefit.created', 'min'=>1, 'max'=>1},
      'enterer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.enterer', 'min'=>0, 'max'=>1},
      'insurer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.insurer', 'min'=>1, 'max'=>1},
      'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.provider', 'min'=>1, 'max'=>1},
      'priority' => {'type'=>'CodeableConcept', 'path'=>'ExplanationOfBenefit.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://terminology.hl7.org/CodeSystem/processpriority', 'uri'=>nil}},
      'fundsReserveRequested' => {'type'=>'CodeableConcept', 'path'=>'ExplanationOfBenefit.fundsReserveRequested', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/fundsreserve', 'uri'=>nil}},
      'fundsReserve' => {'type'=>'CodeableConcept', 'path'=>'ExplanationOfBenefit.fundsReserve', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/fundsreserve', 'uri'=>nil}},
      'related' => {'type'=>'ExplanationOfBenefit::Related', 'path'=>'ExplanationOfBenefit.related', 'min'=>0, 'max'=>Float::INFINITY},
      'prescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.prescription', 'min'=>0, 'max'=>1},
      'originalPrescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.originalPrescription', 'min'=>0, 'max'=>1},
      'payee' => {'type'=>'ExplanationOfBenefit::Payee', 'path'=>'ExplanationOfBenefit.payee', 'min'=>0, 'max'=>1},
      'referral' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.referral', 'min'=>0, 'max'=>1},
      'facility' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.facility', 'min'=>0, 'max'=>1},
      'claim' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.claim', 'min'=>0, 'max'=>1},
      'claimResponse' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'ExplanationOfBenefit.claimResponse', 'min'=>0, 'max'=>1},
      'outcome' => {'type'=>'code', 'path'=>'ExplanationOfBenefit.outcome', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/remittance-outcome|4.0.0', 'uri'=>nil}},
      'disposition' => {'type'=>'string', 'path'=>'ExplanationOfBenefit.disposition', 'min'=>0, 'max'=>1},
      'preAuthRef' => {'type'=>'string', 'path'=>'ExplanationOfBenefit.preAuthRef', 'min'=>0, 'max'=>Float::INFINITY},
      'preAuthRefPeriod' => {'type'=>'Period', 'path'=>'ExplanationOfBenefit.preAuthRefPeriod', 'min'=>0, 'max'=>Float::INFINITY},
      'careTeam' => {'type'=>'ExplanationOfBenefit::CareTeam', 'path'=>'ExplanationOfBenefit.careTeam', 'min'=>0, 'max'=>Float::INFINITY},
      'supportingInfo' => {'type'=>'ExplanationOfBenefit::SupportingInfo', 'path'=>'ExplanationOfBenefit.supportingInfo', 'min'=>0, 'max'=>Float::INFINITY},
      'diagnosis' => {'type'=>'ExplanationOfBenefit::Diagnosis', 'path'=>'ExplanationOfBenefit.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
      'procedure' => {'type'=>'ExplanationOfBenefit::Procedure', 'path'=>'ExplanationOfBenefit.procedure', 'min'=>0, 'max'=>Float::INFINITY},
      'precedence' => {'type'=>'positiveInt', 'path'=>'ExplanationOfBenefit.precedence', 'min'=>0, 'max'=>1},
      'insurance' => {'type'=>'ExplanationOfBenefit::Insurance', 'path'=>'ExplanationOfBenefit.insurance', 'min'=>1, 'max'=>Float::INFINITY},
      'accident' => {'type'=>'ExplanationOfBenefit::Accident', 'path'=>'ExplanationOfBenefit.accident', 'min'=>0, 'max'=>1},
      'item' => {'type'=>'ExplanationOfBenefit::Item', 'path'=>'ExplanationOfBenefit.item', 'min'=>0, 'max'=>Float::INFINITY},
      'addItem' => {'type'=>'ExplanationOfBenefit::AddItem', 'path'=>'ExplanationOfBenefit.addItem', 'min'=>0, 'max'=>Float::INFINITY},
      'adjudication' => {'type'=>'ExplanationOfBenefit::Item::Adjudication', 'path'=>'ExplanationOfBenefit.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
      'total' => {'type'=>'ExplanationOfBenefit::Total', 'path'=>'ExplanationOfBenefit.total', 'min'=>0, 'max'=>Float::INFINITY},
      'payment' => {'type'=>'ExplanationOfBenefit::Payment', 'path'=>'ExplanationOfBenefit.payment', 'min'=>0, 'max'=>1},
      'formCode' => {'type'=>'CodeableConcept', 'path'=>'ExplanationOfBenefit.formCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/forms', 'uri'=>nil}},
      'form' => {'type'=>'Attachment', 'path'=>'ExplanationOfBenefit.form', 'min'=>0, 'max'=>1},
      'processNote' => {'type'=>'ExplanationOfBenefit::ProcessNote', 'path'=>'ExplanationOfBenefit.processNote', 'min'=>0, 'max'=>Float::INFINITY},
      'benefitPeriod' => {'type'=>'Period', 'path'=>'ExplanationOfBenefit.benefitPeriod', 'min'=>0, 'max'=>1},
      'benefitBalance' => {'type'=>'ExplanationOfBenefit::BenefitBalance', 'path'=>'ExplanationOfBenefit.benefitBalance', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Related < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Related.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Related.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Related.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'claim' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'Related.claim', 'min'=>0, 'max'=>1},
        'relationship' => {'type'=>'CodeableConcept', 'path'=>'Related.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/related-claim-relationship', 'uri'=>nil}},
        'reference' => {'type'=>'Identifier', 'path'=>'Related.reference', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :claim             # 0-1 Reference(Claim)
      attr_accessor :relationship      # 0-1 CodeableConcept
      attr_accessor :reference         # 0-1 Identifier
    end

    class Payee < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Payee.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Payee.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Payee.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Payee.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/payeetype', 'uri'=>nil}},
        'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Payee.party', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :party             # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson)
    end

    class CareTeam < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'CareTeam.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'CareTeam.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'CareTeam.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'CareTeam.sequence', 'min'=>1, 'max'=>1},
        'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'CareTeam.provider', 'min'=>1, 'max'=>1},
        'responsible' => {'type'=>'boolean', 'path'=>'CareTeam.responsible', 'min'=>0, 'max'=>1},
        'role' => {'type'=>'CodeableConcept', 'path'=>'CareTeam.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-careteamrole', 'uri'=>nil}},
        'qualification' => {'type'=>'CodeableConcept', 'path'=>'CareTeam.qualification', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/provider-qualification', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :sequence          # 1-1 positiveInt
      attr_accessor :provider          # 1-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :responsible       # 0-1 boolean
      attr_accessor :role              # 0-1 CodeableConcept
      attr_accessor :qualification     # 0-1 CodeableConcept
    end

    class SupportingInfo < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'timing' => ['date', 'Period'],
        'value' => ['boolean', 'string', 'Quantity', 'Attachment', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'SupportingInfo.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'SupportingInfo.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SupportingInfo.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'SupportingInfo.sequence', 'min'=>1, 'max'=>1},
        'category' => {'type'=>'CodeableConcept', 'path'=>'SupportingInfo.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-informationcategory', 'uri'=>nil}},
        'code' => {'type'=>'CodeableConcept', 'path'=>'SupportingInfo.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-exception', 'uri'=>nil}},
        'timingDate' => {'type'=>'date', 'path'=>'SupportingInfo.timing[x]', 'min'=>0, 'max'=>1},
        'timingPeriod' => {'type'=>'Period', 'path'=>'SupportingInfo.timing[x]', 'min'=>0, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
        'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
        'reason' => {'type'=>'Coding', 'path'=>'SupportingInfo.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/missing-tooth-reason', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :sequence          # 1-1 positiveInt
      attr_accessor :category          # 1-1 CodeableConcept
      attr_accessor :code              # 0-1 CodeableConcept
      attr_accessor :timingDate        # 0-1 date
      attr_accessor :timingPeriod      # 0-1 Period
      attr_accessor :valueBoolean      # 0-1 boolean
      attr_accessor :valueString       # 0-1 string
      attr_accessor :valueQuantity     # 0-1 Quantity
      attr_accessor :valueAttachment   # 0-1 Attachment
      attr_accessor :valueReference    # 0-1 Reference(Resource)
      attr_accessor :reason            # 0-1 Coding
    end

    class Diagnosis < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'diagnosis' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Diagnosis.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Diagnosis.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Diagnosis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Diagnosis.sequence', 'min'=>1, 'max'=>1},
        'diagnosisCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Diagnosis.diagnosis[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/icd-10', 'uri'=>nil}},
        'diagnosisReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'Diagnosis.diagnosis[x]', 'min'=>1, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Diagnosis.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-diagnosistype', 'uri'=>nil}},
        'onAdmission' => {'type'=>'CodeableConcept', 'path'=>'Diagnosis.onAdmission', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-diagnosis-on-admission', 'uri'=>nil}},
        'packageCode' => {'type'=>'CodeableConcept', 'path'=>'Diagnosis.packageCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-diagnosisrelatedgroup', 'uri'=>nil}}
      }

      attr_accessor :id                       # 0-1 string
      attr_accessor :extension                # 0-* [ Extension ]
      attr_accessor :modifierExtension        # 0-* [ Extension ]
      attr_accessor :sequence                 # 1-1 positiveInt
      attr_accessor :diagnosisCodeableConcept # 1-1 CodeableConcept
      attr_accessor :diagnosisReference       # 1-1 Reference(Condition)
      attr_accessor :type                     # 0-* [ CodeableConcept ]
      attr_accessor :onAdmission              # 0-1 CodeableConcept
      attr_accessor :packageCode              # 0-1 CodeableConcept
    end

    class Procedure < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'procedure' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Procedure.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Procedure.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Procedure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Procedure.sequence', 'min'=>1, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Procedure.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-procedure-type', 'uri'=>nil}},
        'date' => {'type'=>'dateTime', 'path'=>'Procedure.date', 'min'=>0, 'max'=>1},
        'procedureCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/icd-10-procedures', 'uri'=>nil}},
        'procedureReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1},
        'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Procedure.udi', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                       # 0-1 string
      attr_accessor :extension                # 0-* [ Extension ]
      attr_accessor :modifierExtension        # 0-* [ Extension ]
      attr_accessor :sequence                 # 1-1 positiveInt
      attr_accessor :type                     # 0-* [ CodeableConcept ]
      attr_accessor :date                     # 0-1 dateTime
      attr_accessor :procedureCodeableConcept # 1-1 CodeableConcept
      attr_accessor :procedureReference       # 1-1 Reference(Procedure)
      attr_accessor :udi                      # 0-* [ Reference(Device) ]
    end

    class Insurance < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Insurance.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Insurance.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Insurance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'focal' => {'type'=>'boolean', 'path'=>'Insurance.focal', 'min'=>1, 'max'=>1},
        'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Insurance.coverage', 'min'=>1, 'max'=>1},
        'preAuthRef' => {'type'=>'string', 'path'=>'Insurance.preAuthRef', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :focal             # 1-1 boolean
      attr_accessor :coverage          # 1-1 Reference(Coverage)
      attr_accessor :preAuthRef        # 0-* [ string ]
    end

    class Accident < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'location' => ['Address', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Accident.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Accident.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Accident.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'date' => {'type'=>'date', 'path'=>'Accident.date', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Accident.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://terminology.hl7.org/ValueSet/v3-ActIncidentCode', 'uri'=>nil}},
        'locationAddress' => {'type'=>'Address', 'path'=>'Accident.location[x]', 'min'=>0, 'max'=>1},
        'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Accident.location[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :date              # 0-1 date
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :locationAddress   # 0-1 Address
      attr_accessor :locationReference # 0-1 Reference(Location)
    end

    class Item < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'serviced' => ['date', 'Period'],
        'location' => ['CodeableConcept', 'Address', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Item.sequence', 'min'=>1, 'max'=>1},
        'careTeamSequence' => {'type'=>'positiveInt', 'path'=>'Item.careTeamSequence', 'min'=>0, 'max'=>Float::INFINITY},
        'diagnosisSequence' => {'type'=>'positiveInt', 'path'=>'Item.diagnosisSequence', 'min'=>0, 'max'=>Float::INFINITY},
        'procedureSequence' => {'type'=>'positiveInt', 'path'=>'Item.procedureSequence', 'min'=>0, 'max'=>Float::INFINITY},
        'informationSequence' => {'type'=>'positiveInt', 'path'=>'Item.informationSequence', 'min'=>0, 'max'=>Float::INFINITY},
        'revenue' => {'type'=>'CodeableConcept', 'path'=>'Item.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center', 'uri'=>nil}},
        'category' => {'type'=>'CodeableConcept', 'path'=>'Item.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory', 'uri'=>nil}},
        'productOrService' => {'type'=>'CodeableConcept', 'path'=>'Item.productOrService', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-uscls', 'uri'=>nil}},
        'modifier' => {'type'=>'CodeableConcept', 'path'=>'Item.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-modifiers', 'uri'=>nil}},
        'programCode' => {'type'=>'CodeableConcept', 'path'=>'Item.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-program-code', 'uri'=>nil}},
        'servicedDate' => {'type'=>'date', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
        'servicedPeriod' => {'type'=>'Period', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
        'locationCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-place', 'uri'=>nil}},
        'locationAddress' => {'type'=>'Address', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1},
        'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'Item.quantity', 'min'=>0, 'max'=>1},
        'unitPrice' => {'type'=>'Money', 'path'=>'Item.unitPrice', 'min'=>0, 'max'=>1},
        'factor' => {'type'=>'decimal', 'path'=>'Item.factor', 'min'=>0, 'max'=>1},
        'net' => {'type'=>'Money', 'path'=>'Item.net', 'min'=>0, 'max'=>1},
        'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Item.udi', 'min'=>0, 'max'=>Float::INFINITY},
        'bodySite' => {'type'=>'CodeableConcept', 'path'=>'Item.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/tooth', 'uri'=>nil}},
        'subSite' => {'type'=>'CodeableConcept', 'path'=>'Item.subSite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/surface', 'uri'=>nil}},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Item.encounter', 'min'=>0, 'max'=>Float::INFINITY},
        'noteNumber' => {'type'=>'positiveInt', 'path'=>'Item.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
        'adjudication' => {'type'=>'ExplanationOfBenefit::Item::Adjudication', 'path'=>'Item.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
        'detail' => {'type'=>'ExplanationOfBenefit::Item::Detail', 'path'=>'Item.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Adjudication < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Adjudication.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Adjudication.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Adjudication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'category' => {'type'=>'CodeableConcept', 'path'=>'Adjudication.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adjudication', 'uri'=>nil}},
          'reason' => {'type'=>'CodeableConcept', 'path'=>'Adjudication.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adjudication-reason', 'uri'=>nil}},
          'amount' => {'type'=>'Money', 'path'=>'Adjudication.amount', 'min'=>0, 'max'=>1},
          'value' => {'type'=>'decimal', 'path'=>'Adjudication.value', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :category          # 1-1 CodeableConcept
        attr_accessor :reason            # 0-1 CodeableConcept
        attr_accessor :amount            # 0-1 Money
        attr_accessor :value             # 0-1 decimal
      end

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Detail.sequence', 'min'=>1, 'max'=>1},
          'revenue' => {'type'=>'CodeableConcept', 'path'=>'Detail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center', 'uri'=>nil}},
          'category' => {'type'=>'CodeableConcept', 'path'=>'Detail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory', 'uri'=>nil}},
          'productOrService' => {'type'=>'CodeableConcept', 'path'=>'Detail.productOrService', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-uscls', 'uri'=>nil}},
          'modifier' => {'type'=>'CodeableConcept', 'path'=>'Detail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-modifiers', 'uri'=>nil}},
          'programCode' => {'type'=>'CodeableConcept', 'path'=>'Detail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-program-code', 'uri'=>nil}},
          'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Money', 'path'=>'Detail.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'Detail.factor', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Money', 'path'=>'Detail.net', 'min'=>0, 'max'=>1},
          'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Detail.udi', 'min'=>0, 'max'=>Float::INFINITY},
          'noteNumber' => {'type'=>'positiveInt', 'path'=>'Detail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'adjudication' => {'type'=>'ExplanationOfBenefit::Item::Adjudication', 'path'=>'Detail.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
          'subDetail' => {'type'=>'ExplanationOfBenefit::Item::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class SubDetail < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequence' => {'type'=>'positiveInt', 'path'=>'SubDetail.sequence', 'min'=>1, 'max'=>1},
            'revenue' => {'type'=>'CodeableConcept', 'path'=>'SubDetail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center', 'uri'=>nil}},
            'category' => {'type'=>'CodeableConcept', 'path'=>'SubDetail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory', 'uri'=>nil}},
            'productOrService' => {'type'=>'CodeableConcept', 'path'=>'SubDetail.productOrService', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-uscls', 'uri'=>nil}},
            'modifier' => {'type'=>'CodeableConcept', 'path'=>'SubDetail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-modifiers', 'uri'=>nil}},
            'programCode' => {'type'=>'CodeableConcept', 'path'=>'SubDetail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-program-code', 'uri'=>nil}},
            'quantity' => {'type'=>'Quantity', 'path'=>'SubDetail.quantity', 'min'=>0, 'max'=>1},
            'unitPrice' => {'type'=>'Money', 'path'=>'SubDetail.unitPrice', 'min'=>0, 'max'=>1},
            'factor' => {'type'=>'decimal', 'path'=>'SubDetail.factor', 'min'=>0, 'max'=>1},
            'net' => {'type'=>'Money', 'path'=>'SubDetail.net', 'min'=>0, 'max'=>1},
            'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SubDetail.udi', 'min'=>0, 'max'=>Float::INFINITY},
            'noteNumber' => {'type'=>'positiveInt', 'path'=>'SubDetail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'adjudication' => {'type'=>'ExplanationOfBenefit::Item::Adjudication', 'path'=>'SubDetail.adjudication', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sequence          # 1-1 positiveInt
          attr_accessor :revenue           # 0-1 CodeableConcept
          attr_accessor :category          # 0-1 CodeableConcept
          attr_accessor :productOrService  # 1-1 CodeableConcept
          attr_accessor :modifier          # 0-* [ CodeableConcept ]
          attr_accessor :programCode       # 0-* [ CodeableConcept ]
          attr_accessor :quantity          # 0-1 Quantity
          attr_accessor :unitPrice         # 0-1 Money
          attr_accessor :factor            # 0-1 decimal
          attr_accessor :net               # 0-1 Money
          attr_accessor :udi               # 0-* [ Reference(Device) ]
          attr_accessor :noteNumber        # 0-* [ positiveInt ]
          attr_accessor :adjudication      # 0-* [ ExplanationOfBenefit::Item::Adjudication ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequence          # 1-1 positiveInt
        attr_accessor :revenue           # 0-1 CodeableConcept
        attr_accessor :category          # 0-1 CodeableConcept
        attr_accessor :productOrService  # 1-1 CodeableConcept
        attr_accessor :modifier          # 0-* [ CodeableConcept ]
        attr_accessor :programCode       # 0-* [ CodeableConcept ]
        attr_accessor :quantity          # 0-1 Quantity
        attr_accessor :unitPrice         # 0-1 Money
        attr_accessor :factor            # 0-1 decimal
        attr_accessor :net               # 0-1 Money
        attr_accessor :udi               # 0-* [ Reference(Device) ]
        attr_accessor :noteNumber        # 0-* [ positiveInt ]
        attr_accessor :adjudication      # 0-* [ ExplanationOfBenefit::Item::Adjudication ]
        attr_accessor :subDetail         # 0-* [ ExplanationOfBenefit::Item::Detail::SubDetail ]
      end

      attr_accessor :id                      # 0-1 string
      attr_accessor :extension               # 0-* [ Extension ]
      attr_accessor :modifierExtension       # 0-* [ Extension ]
      attr_accessor :sequence                # 1-1 positiveInt
      attr_accessor :careTeamSequence        # 0-* [ positiveInt ]
      attr_accessor :diagnosisSequence       # 0-* [ positiveInt ]
      attr_accessor :procedureSequence       # 0-* [ positiveInt ]
      attr_accessor :informationSequence     # 0-* [ positiveInt ]
      attr_accessor :revenue                 # 0-1 CodeableConcept
      attr_accessor :category                # 0-1 CodeableConcept
      attr_accessor :productOrService        # 1-1 CodeableConcept
      attr_accessor :modifier                # 0-* [ CodeableConcept ]
      attr_accessor :programCode             # 0-* [ CodeableConcept ]
      attr_accessor :servicedDate            # 0-1 date
      attr_accessor :servicedPeriod          # 0-1 Period
      attr_accessor :locationCodeableConcept # 0-1 CodeableConcept
      attr_accessor :locationAddress         # 0-1 Address
      attr_accessor :locationReference       # 0-1 Reference(Location)
      attr_accessor :quantity                # 0-1 Quantity
      attr_accessor :unitPrice               # 0-1 Money
      attr_accessor :factor                  # 0-1 decimal
      attr_accessor :net                     # 0-1 Money
      attr_accessor :udi                     # 0-* [ Reference(Device) ]
      attr_accessor :bodySite                # 0-1 CodeableConcept
      attr_accessor :subSite                 # 0-* [ CodeableConcept ]
      attr_accessor :encounter               # 0-* [ Reference(Encounter) ]
      attr_accessor :noteNumber              # 0-* [ positiveInt ]
      attr_accessor :adjudication            # 0-* [ ExplanationOfBenefit::Item::Adjudication ]
      attr_accessor :detail                  # 0-* [ ExplanationOfBenefit::Item::Detail ]
    end

    class AddItem < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'serviced' => ['date', 'Period'],
        'location' => ['CodeableConcept', 'Address', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'AddItem.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'AddItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'AddItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'itemSequence' => {'type'=>'positiveInt', 'path'=>'AddItem.itemSequence', 'min'=>0, 'max'=>Float::INFINITY},
        'detailSequence' => {'type'=>'positiveInt', 'path'=>'AddItem.detailSequence', 'min'=>0, 'max'=>Float::INFINITY},
        'subDetailSequence' => {'type'=>'positiveInt', 'path'=>'AddItem.subDetailSequence', 'min'=>0, 'max'=>Float::INFINITY},
        'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'AddItem.provider', 'min'=>0, 'max'=>Float::INFINITY},
        'productOrService' => {'type'=>'CodeableConcept', 'path'=>'AddItem.productOrService', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-uscls', 'uri'=>nil}},
        'modifier' => {'type'=>'CodeableConcept', 'path'=>'AddItem.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-modifiers', 'uri'=>nil}},
        'programCode' => {'type'=>'CodeableConcept', 'path'=>'AddItem.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-program-code', 'uri'=>nil}},
        'servicedDate' => {'type'=>'date', 'path'=>'AddItem.serviced[x]', 'min'=>0, 'max'=>1},
        'servicedPeriod' => {'type'=>'Period', 'path'=>'AddItem.serviced[x]', 'min'=>0, 'max'=>1},
        'locationCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'AddItem.location[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-place', 'uri'=>nil}},
        'locationAddress' => {'type'=>'Address', 'path'=>'AddItem.location[x]', 'min'=>0, 'max'=>1},
        'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'AddItem.location[x]', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'AddItem.quantity', 'min'=>0, 'max'=>1},
        'unitPrice' => {'type'=>'Money', 'path'=>'AddItem.unitPrice', 'min'=>0, 'max'=>1},
        'factor' => {'type'=>'decimal', 'path'=>'AddItem.factor', 'min'=>0, 'max'=>1},
        'net' => {'type'=>'Money', 'path'=>'AddItem.net', 'min'=>0, 'max'=>1},
        'bodySite' => {'type'=>'CodeableConcept', 'path'=>'AddItem.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/tooth', 'uri'=>nil}},
        'subSite' => {'type'=>'CodeableConcept', 'path'=>'AddItem.subSite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/surface', 'uri'=>nil}},
        'noteNumber' => {'type'=>'positiveInt', 'path'=>'AddItem.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
        'adjudication' => {'type'=>'ExplanationOfBenefit::Item::Adjudication', 'path'=>'AddItem.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
        'detail' => {'type'=>'ExplanationOfBenefit::AddItem::Detail', 'path'=>'AddItem.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'productOrService' => {'type'=>'CodeableConcept', 'path'=>'Detail.productOrService', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-uscls', 'uri'=>nil}},
          'modifier' => {'type'=>'CodeableConcept', 'path'=>'Detail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-modifiers', 'uri'=>nil}},
          'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Money', 'path'=>'Detail.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'Detail.factor', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Money', 'path'=>'Detail.net', 'min'=>0, 'max'=>1},
          'noteNumber' => {'type'=>'positiveInt', 'path'=>'Detail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'adjudication' => {'type'=>'ExplanationOfBenefit::Item::Adjudication', 'path'=>'Detail.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
          'subDetail' => {'type'=>'ExplanationOfBenefit::AddItem::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class SubDetail < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'productOrService' => {'type'=>'CodeableConcept', 'path'=>'SubDetail.productOrService', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/service-uscls', 'uri'=>nil}},
            'modifier' => {'type'=>'CodeableConcept', 'path'=>'SubDetail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-modifiers', 'uri'=>nil}},
            'quantity' => {'type'=>'Quantity', 'path'=>'SubDetail.quantity', 'min'=>0, 'max'=>1},
            'unitPrice' => {'type'=>'Money', 'path'=>'SubDetail.unitPrice', 'min'=>0, 'max'=>1},
            'factor' => {'type'=>'decimal', 'path'=>'SubDetail.factor', 'min'=>0, 'max'=>1},
            'net' => {'type'=>'Money', 'path'=>'SubDetail.net', 'min'=>0, 'max'=>1},
            'noteNumber' => {'type'=>'positiveInt', 'path'=>'SubDetail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'adjudication' => {'type'=>'ExplanationOfBenefit::Item::Adjudication', 'path'=>'SubDetail.adjudication', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :productOrService  # 1-1 CodeableConcept
          attr_accessor :modifier          # 0-* [ CodeableConcept ]
          attr_accessor :quantity          # 0-1 Quantity
          attr_accessor :unitPrice         # 0-1 Money
          attr_accessor :factor            # 0-1 decimal
          attr_accessor :net               # 0-1 Money
          attr_accessor :noteNumber        # 0-* [ positiveInt ]
          attr_accessor :adjudication      # 0-* [ ExplanationOfBenefit::Item::Adjudication ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :productOrService  # 1-1 CodeableConcept
        attr_accessor :modifier          # 0-* [ CodeableConcept ]
        attr_accessor :quantity          # 0-1 Quantity
        attr_accessor :unitPrice         # 0-1 Money
        attr_accessor :factor            # 0-1 decimal
        attr_accessor :net               # 0-1 Money
        attr_accessor :noteNumber        # 0-* [ positiveInt ]
        attr_accessor :adjudication      # 0-* [ ExplanationOfBenefit::Item::Adjudication ]
        attr_accessor :subDetail         # 0-* [ ExplanationOfBenefit::AddItem::Detail::SubDetail ]
      end

      attr_accessor :id                      # 0-1 string
      attr_accessor :extension               # 0-* [ Extension ]
      attr_accessor :modifierExtension       # 0-* [ Extension ]
      attr_accessor :itemSequence            # 0-* [ positiveInt ]
      attr_accessor :detailSequence          # 0-* [ positiveInt ]
      attr_accessor :subDetailSequence       # 0-* [ positiveInt ]
      attr_accessor :provider                # 0-* [ Reference(Practitioner|PractitionerRole|Organization) ]
      attr_accessor :productOrService        # 1-1 CodeableConcept
      attr_accessor :modifier                # 0-* [ CodeableConcept ]
      attr_accessor :programCode             # 0-* [ CodeableConcept ]
      attr_accessor :servicedDate            # 0-1 date
      attr_accessor :servicedPeriod          # 0-1 Period
      attr_accessor :locationCodeableConcept # 0-1 CodeableConcept
      attr_accessor :locationAddress         # 0-1 Address
      attr_accessor :locationReference       # 0-1 Reference(Location)
      attr_accessor :quantity                # 0-1 Quantity
      attr_accessor :unitPrice               # 0-1 Money
      attr_accessor :factor                  # 0-1 decimal
      attr_accessor :net                     # 0-1 Money
      attr_accessor :bodySite                # 0-1 CodeableConcept
      attr_accessor :subSite                 # 0-* [ CodeableConcept ]
      attr_accessor :noteNumber              # 0-* [ positiveInt ]
      attr_accessor :adjudication            # 0-* [ ExplanationOfBenefit::Item::Adjudication ]
      attr_accessor :detail                  # 0-* [ ExplanationOfBenefit::AddItem::Detail ]
    end

    class Total < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Total.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Total.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Total.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'category' => {'type'=>'CodeableConcept', 'path'=>'Total.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adjudication', 'uri'=>nil}},
        'amount' => {'type'=>'Money', 'path'=>'Total.amount', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :category          # 1-1 CodeableConcept
      attr_accessor :amount            # 1-1 Money
    end

    class Payment < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Payment.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Payment.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Payment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Payment.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-paymenttype', 'uri'=>nil}},
        'adjustment' => {'type'=>'Money', 'path'=>'Payment.adjustment', 'min'=>0, 'max'=>1},
        'adjustmentReason' => {'type'=>'CodeableConcept', 'path'=>'Payment.adjustmentReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/payment-adjustment-reason', 'uri'=>nil}},
        'date' => {'type'=>'date', 'path'=>'Payment.date', 'min'=>0, 'max'=>1},
        'amount' => {'type'=>'Money', 'path'=>'Payment.amount', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'Payment.identifier', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :adjustment        # 0-1 Money
      attr_accessor :adjustmentReason  # 0-1 CodeableConcept
      attr_accessor :date              # 0-1 date
      attr_accessor :amount            # 0-1 Money
      attr_accessor :identifier        # 0-1 Identifier
    end

    class ProcessNote < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ProcessNote.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ProcessNote.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ProcessNote.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'number' => {'type'=>'positiveInt', 'path'=>'ProcessNote.number', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'code', 'path'=>'ProcessNote.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/note-type|4.0.0', 'uri'=>nil}},
        'text' => {'type'=>'string', 'path'=>'ProcessNote.text', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'CodeableConcept', 'path'=>'ProcessNote.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :number            # 0-1 positiveInt
      attr_accessor :type              # 0-1 code
      attr_accessor :text              # 0-1 string
      attr_accessor :language          # 0-1 CodeableConcept
    end

    class BenefitBalance < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'BenefitBalance.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'BenefitBalance.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'BenefitBalance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'category' => {'type'=>'CodeableConcept', 'path'=>'BenefitBalance.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory', 'uri'=>nil}},
        'excluded' => {'type'=>'boolean', 'path'=>'BenefitBalance.excluded', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'BenefitBalance.name', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'BenefitBalance.description', 'min'=>0, 'max'=>1},
        'network' => {'type'=>'CodeableConcept', 'path'=>'BenefitBalance.network', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/benefit-network', 'uri'=>nil}},
        'unit' => {'type'=>'CodeableConcept', 'path'=>'BenefitBalance.unit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/benefit-unit', 'uri'=>nil}},
        'term' => {'type'=>'CodeableConcept', 'path'=>'BenefitBalance.term', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/benefit-term', 'uri'=>nil}},
        'financial' => {'type'=>'ExplanationOfBenefit::BenefitBalance::Financial', 'path'=>'BenefitBalance.financial', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Financial < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'allowed' => ['unsignedInt', 'string', 'Money'],
          'used' => ['unsignedInt', 'Money']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Financial.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Financial.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Financial.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Financial.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/benefit-type', 'uri'=>nil}},
          'allowedUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Financial.allowed[x]', 'min'=>0, 'max'=>1},
          'allowedString' => {'type'=>'string', 'path'=>'Financial.allowed[x]', 'min'=>0, 'max'=>1},
          'allowedMoney' => {'type'=>'Money', 'path'=>'Financial.allowed[x]', 'min'=>0, 'max'=>1},
          'usedUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Financial.used[x]', 'min'=>0, 'max'=>1},
          'usedMoney' => {'type'=>'Money', 'path'=>'Financial.used[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :type               # 1-1 CodeableConcept
        attr_accessor :allowedUnsignedInt # 0-1 unsignedInt
        attr_accessor :allowedString      # 0-1 string
        attr_accessor :allowedMoney       # 0-1 Money
        attr_accessor :usedUnsignedInt    # 0-1 unsignedInt
        attr_accessor :usedMoney          # 0-1 Money
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :category          # 1-1 CodeableConcept
      attr_accessor :excluded          # 0-1 boolean
      attr_accessor :name              # 0-1 string
      attr_accessor :description       # 0-1 string
      attr_accessor :network           # 0-1 CodeableConcept
      attr_accessor :unit              # 0-1 CodeableConcept
      attr_accessor :term              # 0-1 CodeableConcept
      attr_accessor :financial         # 0-* [ ExplanationOfBenefit::BenefitBalance::Financial ]
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
    attr_accessor :status                # 1-1 code
    attr_accessor :type                  # 1-1 CodeableConcept
    attr_accessor :subType               # 0-1 CodeableConcept
    attr_accessor :use                   # 1-1 code
    attr_accessor :patient               # 1-1 Reference(Patient)
    attr_accessor :billablePeriod        # 0-1 Period
    attr_accessor :created               # 1-1 dateTime
    attr_accessor :enterer               # 0-1 Reference(Practitioner|PractitionerRole)
    attr_accessor :insurer               # 1-1 Reference(Organization)
    attr_accessor :provider              # 1-1 Reference(Practitioner|PractitionerRole|Organization)
    attr_accessor :priority              # 0-1 CodeableConcept
    attr_accessor :fundsReserveRequested # 0-1 CodeableConcept
    attr_accessor :fundsReserve          # 0-1 CodeableConcept
    attr_accessor :related               # 0-* [ ExplanationOfBenefit::Related ]
    attr_accessor :prescription          # 0-1 Reference(MedicationRequest|VisionPrescription)
    attr_accessor :originalPrescription  # 0-1 Reference(MedicationRequest)
    attr_accessor :payee                 # 0-1 ExplanationOfBenefit::Payee
    attr_accessor :referral              # 0-1 Reference(ServiceRequest)
    attr_accessor :facility              # 0-1 Reference(Location)
    attr_accessor :claim                 # 0-1 Reference(Claim)
    attr_accessor :claimResponse         # 0-1 Reference(ClaimResponse)
    attr_accessor :outcome               # 1-1 code
    attr_accessor :disposition           # 0-1 string
    attr_accessor :preAuthRef            # 0-* [ string ]
    attr_accessor :preAuthRefPeriod      # 0-* [ Period ]
    attr_accessor :careTeam              # 0-* [ ExplanationOfBenefit::CareTeam ]
    attr_accessor :supportingInfo        # 0-* [ ExplanationOfBenefit::SupportingInfo ]
    attr_accessor :diagnosis             # 0-* [ ExplanationOfBenefit::Diagnosis ]
    attr_accessor :procedure             # 0-* [ ExplanationOfBenefit::Procedure ]
    attr_accessor :precedence            # 0-1 positiveInt
    attr_accessor :insurance             # 1-* [ ExplanationOfBenefit::Insurance ]
    attr_accessor :accident              # 0-1 ExplanationOfBenefit::Accident
    attr_accessor :item                  # 0-* [ ExplanationOfBenefit::Item ]
    attr_accessor :addItem               # 0-* [ ExplanationOfBenefit::AddItem ]
    attr_accessor :adjudication          # 0-* [ ExplanationOfBenefit::Item::Adjudication ]
    attr_accessor :total                 # 0-* [ ExplanationOfBenefit::Total ]
    attr_accessor :payment               # 0-1 ExplanationOfBenefit::Payment
    attr_accessor :formCode              # 0-1 CodeableConcept
    attr_accessor :form                  # 0-1 Attachment
    attr_accessor :processNote           # 0-* [ ExplanationOfBenefit::ProcessNote ]
    attr_accessor :benefitPeriod         # 0-1 Period
    attr_accessor :benefitBalance        # 0-* [ ExplanationOfBenefit::BenefitBalance ]

    def resourceType
      'ExplanationOfBenefit'
    end
  end
end