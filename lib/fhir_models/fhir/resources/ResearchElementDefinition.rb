module FHIR
  class ResearchElementDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'subject' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['composed-of', 'context', 'context-quantity', 'context-type', 'date', 'depends-on', 'derived-from', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'predecessor', 'publisher', 'status', 'successor', 'title', 'topic', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ResearchElementDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ResearchElementDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ResearchElementDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ResearchElementDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ResearchElementDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ResearchElementDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ResearchElementDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ResearchElementDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'ResearchElementDefinition.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'ResearchElementDefinition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'ResearchElementDefinition.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'ResearchElementDefinition.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'ResearchElementDefinition.title', 'min'=>0, 'max'=>1},
      'shortTitle' => {'type'=>'string', 'path'=>'ResearchElementDefinition.shortTitle', 'min'=>0, 'max'=>1},
      'subtitle' => {'type'=>'string', 'path'=>'ResearchElementDefinition.subtitle', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'ResearchElementDefinition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status|4.0.0'}},
      'experimental' => {'type'=>'boolean', 'path'=>'ResearchElementDefinition.experimental', 'min'=>0, 'max'=>1},
      'subjectCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Patient', 'Practitioner', 'Organization', 'Location', 'Device', 'Account', 'ActivityDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BiologicallyDerivedProduct', 'BodyStructure', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'CatalogEntry', 'ChargeItem', 'ChargeItemDefinition', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Consent', 'Contract', 'Coverage', 'CoverageEligibilityRequest', 'CoverageEligibilityResponse', 'DetectedIssue', 'DeviceDefinition', 'DeviceMetric', 'DeviceRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EffectEvidenceSynthesis', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'EventDefinition', 'Evidence', 'EvidenceVariable', 'ExampleScenario', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingStudy', 'Immunization', 'ImmunizationEvaluation', 'ImmunizationRecommendation', 'ImplementationGuide', 'InsurancePlan', 'Invoice', 'Library', 'Linkage', 'List', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationKnowledge', 'MedicationRequest', 'MedicationStatement', 'MedicinalProduct', 'MedicinalProductAuthorization', 'MedicinalProductContraindication', 'MedicinalProductIndication', 'MedicinalProductIngredient', 'MedicinalProductInteraction', 'MedicinalProductManufactured', 'MedicinalProductPackaged', 'MedicinalProductPharmaceutical', 'MedicinalProductUndesirableEffect', 'MessageDefinition', 'MessageHeader', 'MolecularSequence', 'NamingSystem', 'NutritionOrder', 'Observation', 'ObservationDefinition', 'OperationDefinition', 'OperationOutcome', 'OrganizationAffiliation', 'Parameters', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'PractitionerRole', 'Procedure', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'RelatedPerson', 'RequestGroup', 'ResearchDefinition', 'ResearchElementDefinition', 'ResearchStudy', 'ResearchSubject', 'Resource', 'RiskAssessment', 'RiskEvidenceSynthesis', 'Schedule', 'SearchParameter', 'ServiceRequest', 'Slot', 'Specimen', 'SpecimenDefinition', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SubstanceNucleicAcid', 'SubstancePolymer', 'SubstanceProtein', 'SubstanceReferenceInformation', 'SubstanceSourceMaterial', 'SubstanceSpecification', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TerminologyCapabilities', 'TestReport', 'TestScript', 'ValueSet', 'VerificationResult', 'VisionPrescription']}, 'type'=>'CodeableConcept', 'path'=>'ResearchElementDefinition.subject[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/subject-type'}},
      'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'ResearchElementDefinition.subject[x]', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ResearchElementDefinition.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'ResearchElementDefinition.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'ResearchElementDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'ResearchElementDefinition.description', 'min'=>0, 'max'=>1},
      'comment' => {'type'=>'string', 'path'=>'ResearchElementDefinition.comment', 'min'=>0, 'max'=>Float::INFINITY},
      'useContext' => {'type'=>'UsageContext', 'path'=>'ResearchElementDefinition.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>[], 'urn:iso:std:iso:3166:-2'=>[], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>[]}, 'type'=>'CodeableConcept', 'path'=>'ResearchElementDefinition.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'purpose' => {'type'=>'markdown', 'path'=>'ResearchElementDefinition.purpose', 'min'=>0, 'max'=>1},
      'usage' => {'type'=>'string', 'path'=>'ResearchElementDefinition.usage', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'markdown', 'path'=>'ResearchElementDefinition.copyright', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'ResearchElementDefinition.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'ResearchElementDefinition.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'ResearchElementDefinition.effectivePeriod', 'min'=>0, 'max'=>1},
      'topic' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/definition-topic'=>['treatment', 'education', 'assessment']}, 'type'=>'CodeableConcept', 'path'=>'ResearchElementDefinition.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/definition-topic'}},
      'author' => {'type'=>'ContactDetail', 'path'=>'ResearchElementDefinition.author', 'min'=>0, 'max'=>Float::INFINITY},
      'editor' => {'type'=>'ContactDetail', 'path'=>'ResearchElementDefinition.editor', 'min'=>0, 'max'=>Float::INFINITY},
      'reviewer' => {'type'=>'ContactDetail', 'path'=>'ResearchElementDefinition.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
      'endorser' => {'type'=>'ContactDetail', 'path'=>'ResearchElementDefinition.endorser', 'min'=>0, 'max'=>Float::INFINITY},
      'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'ResearchElementDefinition.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
      'library' => {'type'=>'canonical', 'path'=>'ResearchElementDefinition.library', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'type'=>'code', 'path'=>'ResearchElementDefinition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/research-element-type|4.0.0'}},
      'variableType' => {'type'=>'code', 'path'=>'ResearchElementDefinition.variableType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/variable-type|4.0.0'}},
      'characteristic' => {'type'=>'ResearchElementDefinition::Characteristic', 'path'=>'ResearchElementDefinition.characteristic', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class Characteristic < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'definition' => ['CodeableConcept', 'canonical', 'Expression', 'DataRequirement'],
        'studyEffective' => ['dateTime', 'Period', 'Duration', 'Timing'],
        'participantEffective' => ['dateTime', 'Period', 'Duration', 'Timing']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Characteristic.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Characteristic.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Characteristic.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'definitionCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Characteristic.definition[x]', 'min'=>1, 'max'=>1},
        'definitionCanonical' => {'type'=>'canonical', 'path'=>'Characteristic.definition[x]', 'min'=>1, 'max'=>1},
        'definitionExpression' => {'type'=>'Expression', 'path'=>'Characteristic.definition[x]', 'min'=>1, 'max'=>1},
        'definitionDataRequirement' => {'type'=>'DataRequirement', 'path'=>'Characteristic.definition[x]', 'min'=>1, 'max'=>1},
        'usageContext' => {'type'=>'UsageContext', 'path'=>'Characteristic.usageContext', 'min'=>0, 'max'=>Float::INFINITY},
        'exclude' => {'type'=>'boolean', 'path'=>'Characteristic.exclude', 'min'=>0, 'max'=>1},
        'unitOfMeasure' => {'type'=>'CodeableConcept', 'path'=>'Characteristic.unitOfMeasure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/ucum-units|4.0.0'}},
        'studyEffectiveDescription' => {'type'=>'string', 'path'=>'Characteristic.studyEffectiveDescription', 'min'=>0, 'max'=>1},
        'studyEffectiveDateTime' => {'type'=>'dateTime', 'path'=>'Characteristic.studyEffective[x]', 'min'=>0, 'max'=>1},
        'studyEffectivePeriod' => {'type'=>'Period', 'path'=>'Characteristic.studyEffective[x]', 'min'=>0, 'max'=>1},
        'studyEffectiveDuration' => {'type'=>'Duration', 'path'=>'Characteristic.studyEffective[x]', 'min'=>0, 'max'=>1},
        'studyEffectiveTiming' => {'type'=>'Timing', 'path'=>'Characteristic.studyEffective[x]', 'min'=>0, 'max'=>1},
        'studyEffectiveTimeFromStart' => {'type'=>'Duration', 'path'=>'Characteristic.studyEffectiveTimeFromStart', 'min'=>0, 'max'=>1},
        'studyEffectiveGroupMeasure' => {'type'=>'code', 'path'=>'Characteristic.studyEffectiveGroupMeasure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/group-measure|4.0.0'}},
        'participantEffectiveDescription' => {'type'=>'string', 'path'=>'Characteristic.participantEffectiveDescription', 'min'=>0, 'max'=>1},
        'participantEffectiveDateTime' => {'type'=>'dateTime', 'path'=>'Characteristic.participantEffective[x]', 'min'=>0, 'max'=>1},
        'participantEffectivePeriod' => {'type'=>'Period', 'path'=>'Characteristic.participantEffective[x]', 'min'=>0, 'max'=>1},
        'participantEffectiveDuration' => {'type'=>'Duration', 'path'=>'Characteristic.participantEffective[x]', 'min'=>0, 'max'=>1},
        'participantEffectiveTiming' => {'type'=>'Timing', 'path'=>'Characteristic.participantEffective[x]', 'min'=>0, 'max'=>1},
        'participantEffectiveTimeFromStart' => {'type'=>'Duration', 'path'=>'Characteristic.participantEffectiveTimeFromStart', 'min'=>0, 'max'=>1},
        'participantEffectiveGroupMeasure' => {'type'=>'code', 'path'=>'Characteristic.participantEffectiveGroupMeasure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/group-measure|4.0.0'}}
      }

      attr_accessor :id                                # 0-1 string
      attr_accessor :extension                         # 0-* [ Extension ]
      attr_accessor :modifierExtension                 # 0-* [ Extension ]
      attr_accessor :definitionCodeableConcept         # 1-1 CodeableConcept
      attr_accessor :definitionCanonical               # 1-1 canonical
      attr_accessor :definitionExpression              # 1-1 Expression
      attr_accessor :definitionDataRequirement         # 1-1 DataRequirement
      attr_accessor :usageContext                      # 0-* [ UsageContext ]
      attr_accessor :exclude                           # 0-1 boolean
      attr_accessor :unitOfMeasure                     # 0-1 CodeableConcept
      attr_accessor :studyEffectiveDescription         # 0-1 string
      attr_accessor :studyEffectiveDateTime            # 0-1 dateTime
      attr_accessor :studyEffectivePeriod              # 0-1 Period
      attr_accessor :studyEffectiveDuration            # 0-1 Duration
      attr_accessor :studyEffectiveTiming              # 0-1 Timing
      attr_accessor :studyEffectiveTimeFromStart       # 0-1 Duration
      attr_accessor :studyEffectiveGroupMeasure        # 0-1 code
      attr_accessor :participantEffectiveDescription   # 0-1 string
      attr_accessor :participantEffectiveDateTime      # 0-1 dateTime
      attr_accessor :participantEffectivePeriod        # 0-1 Period
      attr_accessor :participantEffectiveDuration      # 0-1 Duration
      attr_accessor :participantEffectiveTiming        # 0-1 Timing
      attr_accessor :participantEffectiveTimeFromStart # 0-1 Duration
      attr_accessor :participantEffectiveGroupMeasure  # 0-1 code
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :url                    # 0-1 uri
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :version                # 0-1 string
    attr_accessor :name                   # 0-1 string
    attr_accessor :title                  # 0-1 string
    attr_accessor :shortTitle             # 0-1 string
    attr_accessor :subtitle               # 0-1 string
    attr_accessor :status                 # 1-1 code
    attr_accessor :experimental           # 0-1 boolean
    attr_accessor :subjectCodeableConcept # 0-1 CodeableConcept
    attr_accessor :subjectReference       # 0-1 Reference(Group)
    attr_accessor :date                   # 0-1 dateTime
    attr_accessor :publisher              # 0-1 string
    attr_accessor :contact                # 0-* [ ContactDetail ]
    attr_accessor :description            # 0-1 markdown
    attr_accessor :comment                # 0-* [ string ]
    attr_accessor :useContext             # 0-* [ UsageContext ]
    attr_accessor :jurisdiction           # 0-* [ CodeableConcept ]
    attr_accessor :purpose                # 0-1 markdown
    attr_accessor :usage                  # 0-1 string
    attr_accessor :copyright              # 0-1 markdown
    attr_accessor :approvalDate           # 0-1 date
    attr_accessor :lastReviewDate         # 0-1 date
    attr_accessor :effectivePeriod        # 0-1 Period
    attr_accessor :topic                  # 0-* [ CodeableConcept ]
    attr_accessor :author                 # 0-* [ ContactDetail ]
    attr_accessor :editor                 # 0-* [ ContactDetail ]
    attr_accessor :reviewer               # 0-* [ ContactDetail ]
    attr_accessor :endorser               # 0-* [ ContactDetail ]
    attr_accessor :relatedArtifact        # 0-* [ RelatedArtifact ]
    attr_accessor :library                # 0-* [ canonical ]
    attr_accessor :type                   # 1-1 code
    attr_accessor :variableType           # 0-1 code
    attr_accessor :characteristic         # 1-* [ ResearchElementDefinition::Characteristic ]

    def resourceType
      'ResearchElementDefinition'
    end
  end
end