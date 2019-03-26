module FHIR
  class MedicinalProductUndesirableEffect < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicinalProductUndesirableEffect.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicinalProductUndesirableEffect.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicinalProductUndesirableEffect.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MedicinalProductUndesirableEffect.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicinalProductUndesirableEffect.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicinalProductUndesirableEffect.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicinalProductUndesirableEffect.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicinalProductUndesirableEffect.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicinalProduct', 'http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicinalProductUndesirableEffect.subject', 'min'=>0, 'max'=>Float::INFINITY},
      'symptomConditionEffect' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductUndesirableEffect.symptomConditionEffect', 'min'=>0, 'max'=>1},
      'classification' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductUndesirableEffect.classification', 'min'=>0, 'max'=>1},
      'frequencyOfOccurrence' => {'type'=>'CodeableConcept', 'path'=>'MedicinalProductUndesirableEffect.frequencyOfOccurrence', 'min'=>0, 'max'=>1},
      'population' => {'type'=>'Population', 'path'=>'MedicinalProductUndesirableEffect.population', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :subject                # 0-* [ Reference(MedicinalProduct|Medication) ]
    attr_accessor :symptomConditionEffect # 0-1 CodeableConcept
    attr_accessor :classification         # 0-1 CodeableConcept
    attr_accessor :frequencyOfOccurrence  # 0-1 CodeableConcept
    attr_accessor :population             # 0-* [ Population ]

    def resourceType
      'MedicinalProductUndesirableEffect'
    end
  end
end