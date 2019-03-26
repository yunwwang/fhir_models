module FHIR
  class DataRequirement < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'subject' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = 
    METADATA = {
      'id' => {'type'=>'string', 'path'=>'DataRequirement.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'DataRequirement.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'type'=>'code', 'path'=>'DataRequirement.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/all-types|4.0.0', 'uri'=>nil}},
      'profile' => {'type'=>'canonical', 'path'=>'DataRequirement.profile', 'min'=>0, 'max'=>Float::INFINITY},
      'subjectCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'DataRequirement.subject[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/subject-type', 'uri'=>nil}},
      'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'DataRequirement.subject[x]', 'min'=>0, 'max'=>1},
      'mustSupport' => {'type'=>'string', 'path'=>'DataRequirement.mustSupport', 'min'=>0, 'max'=>Float::INFINITY},
      'codeFilter' => {'type'=>'DataRequirement::CodeFilter', 'path'=>'DataRequirement.codeFilter', 'min'=>0, 'max'=>Float::INFINITY},
      'dateFilter' => {'type'=>'DataRequirement::DateFilter', 'path'=>'DataRequirement.dateFilter', 'min'=>0, 'max'=>Float::INFINITY},
      'limit' => {'type'=>'positiveInt', 'path'=>'DataRequirement.limit', 'min'=>0, 'max'=>1},
      'sort' => {'type'=>'DataRequirement::Sort', 'path'=>'DataRequirement.sort', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class CodeFilter < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'CodeFilter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'CodeFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'path' => {'type'=>'string', 'path'=>'CodeFilter.path', 'min'=>0, 'max'=>1},
        'searchParam' => {'type'=>'string', 'path'=>'CodeFilter.searchParam', 'min'=>0, 'max'=>1},
        'valueSet' => {'type'=>'canonical', 'path'=>'CodeFilter.valueSet', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'Coding', 'path'=>'CodeFilter.code', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id          # 0-1 string
      attr_accessor :extension   # 0-* [ Extension ]
      attr_accessor :path        # 0-1 string
      attr_accessor :searchParam # 0-1 string
      attr_accessor :valueSet    # 0-1 canonical
      attr_accessor :code        # 0-* [ Coding ]
    end

    class DateFilter < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['dateTime', 'Period', 'Duration']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DateFilter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DateFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'path' => {'type'=>'string', 'path'=>'DateFilter.path', 'min'=>0, 'max'=>1},
        'searchParam' => {'type'=>'string', 'path'=>'DateFilter.searchParam', 'min'=>0, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1},
        'valueDuration' => {'type'=>'Duration', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id            # 0-1 string
      attr_accessor :extension     # 0-* [ Extension ]
      attr_accessor :path          # 0-1 string
      attr_accessor :searchParam   # 0-1 string
      attr_accessor :valueDateTime # 0-1 dateTime
      attr_accessor :valuePeriod   # 0-1 Period
      attr_accessor :valueDuration # 0-1 Duration
    end

    class Sort < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Sort.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Sort.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'path' => {'type'=>'string', 'path'=>'Sort.path', 'min'=>1, 'max'=>1},
        'direction' => {'type'=>'code', 'path'=>'Sort.direction', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/sort-direction|4.0.0', 'uri'=>nil}}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :path      # 1-1 string
      attr_accessor :direction # 1-1 code
    end

    attr_accessor :id                     # 0-1 string
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :type                   # 1-1 code
    attr_accessor :profile                # 0-* [ canonical ]
    attr_accessor :subjectCodeableConcept # 0-1 CodeableConcept
    attr_accessor :subjectReference       # 0-1 Reference(Group)
    attr_accessor :mustSupport            # 0-* [ string ]
    attr_accessor :codeFilter             # 0-* [ DataRequirement::CodeFilter ]
    attr_accessor :dateFilter             # 0-* [ DataRequirement::DateFilter ]
    attr_accessor :limit                  # 0-1 positiveInt
    attr_accessor :sort                   # 0-* [ DataRequirement::Sort ]
  end
end