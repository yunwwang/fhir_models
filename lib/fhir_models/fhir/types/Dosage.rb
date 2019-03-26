module FHIR
  class Dosage < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'asNeeded' => ['boolean', 'CodeableConcept']
    }
    SEARCH_PARAMS = 
    METADATA = {
      'id' => {'type'=>'string', 'path'=>'Dosage.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'Dosage.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Dosage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'sequence' => {'type'=>'integer', 'path'=>'Dosage.sequence', 'min'=>0, 'max'=>1},
      'text' => {'type'=>'string', 'path'=>'Dosage.text', 'min'=>0, 'max'=>1},
      'additionalInstruction' => {'type'=>'CodeableConcept', 'path'=>'Dosage.additionalInstruction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/additional-instruction-codes', 'uri'=>nil}},
      'patientInstruction' => {'type'=>'string', 'path'=>'Dosage.patientInstruction', 'min'=>0, 'max'=>1},
      'timing' => {'type'=>'Timing', 'path'=>'Dosage.timing', 'min'=>0, 'max'=>1},
      'asNeededBoolean' => {'type'=>'boolean', 'path'=>'Dosage.asNeeded[x]', 'min'=>0, 'max'=>1},
      'asNeededCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Dosage.asNeeded[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/medication-as-needed-reason', 'uri'=>nil}},
      'site' => {'type'=>'CodeableConcept', 'path'=>'Dosage.site', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/approach-site-codes', 'uri'=>nil}},
      'route' => {'type'=>'CodeableConcept', 'path'=>'Dosage.route', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/route-codes', 'uri'=>nil}},
      'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'Dosage.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/administration-method-codes', 'uri'=>nil}},
      'doseAndRate' => {'type'=>'Dosage::DoseAndRate', 'path'=>'Dosage.doseAndRate', 'min'=>0, 'max'=>Float::INFINITY},
      'maxDosePerPeriod' => {'type'=>'Ratio', 'path'=>'Dosage.maxDosePerPeriod', 'min'=>0, 'max'=>1},
      'maxDosePerAdministration' => {'type'=>'Quantity', 'path'=>'Dosage.maxDosePerAdministration', 'min'=>0, 'max'=>1},
      'maxDosePerLifetime' => {'type'=>'Quantity', 'path'=>'Dosage.maxDosePerLifetime', 'min'=>0, 'max'=>1}
    }

    class DoseAndRate < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'dose' => ['Range', 'Quantity'],
        'rate' => ['Ratio', 'Range', 'Quantity']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DoseAndRate.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DoseAndRate.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'DoseAndRate.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/dose-rate-type', 'uri'=>nil}},
        'doseRange' => {'type'=>'Range', 'path'=>'DoseAndRate.dose[x]', 'min'=>0, 'max'=>1},
        'doseQuantity' => {'type'=>'Quantity', 'path'=>'DoseAndRate.dose[x]', 'min'=>0, 'max'=>1},
        'rateRatio' => {'type'=>'Ratio', 'path'=>'DoseAndRate.rate[x]', 'min'=>0, 'max'=>1},
        'rateRange' => {'type'=>'Range', 'path'=>'DoseAndRate.rate[x]', 'min'=>0, 'max'=>1},
        'rateQuantity' => {'type'=>'Quantity', 'path'=>'DoseAndRate.rate[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id           # 0-1 string
      attr_accessor :extension    # 0-* [ Extension ]
      attr_accessor :type         # 0-1 CodeableConcept
      attr_accessor :doseRange    # 0-1 Range
      attr_accessor :doseQuantity # 0-1 Quantity
      attr_accessor :rateRatio    # 0-1 Ratio
      attr_accessor :rateRange    # 0-1 Range
      attr_accessor :rateQuantity # 0-1 Quantity
    end

    attr_accessor :id                       # 0-1 string
    attr_accessor :extension                # 0-* [ Extension ]
    attr_accessor :modifierExtension        # 0-* [ Extension ]
    attr_accessor :sequence                 # 0-1 integer
    attr_accessor :text                     # 0-1 string
    attr_accessor :additionalInstruction    # 0-* [ CodeableConcept ]
    attr_accessor :patientInstruction       # 0-1 string
    attr_accessor :timing                   # 0-1 Timing
    attr_accessor :asNeededBoolean          # 0-1 boolean
    attr_accessor :asNeededCodeableConcept  # 0-1 CodeableConcept
    attr_accessor :site                     # 0-1 CodeableConcept
    attr_accessor :route                    # 0-1 CodeableConcept
    attr_accessor :local_method             # 0-1 CodeableConcept
    attr_accessor :doseAndRate              # 0-* [ Dosage::DoseAndRate ]
    attr_accessor :maxDosePerPeriod         # 0-1 Ratio
    attr_accessor :maxDosePerAdministration # 0-1 Quantity
    attr_accessor :maxDosePerLifetime       # 0-1 Quantity
  end
end