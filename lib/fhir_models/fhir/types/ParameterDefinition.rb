module FHIR
  class ParameterDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = 
    METADATA = {
      'id' => {'type'=>'string', 'path'=>'ParameterDefinition.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'ParameterDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'name' => {'type'=>'code', 'path'=>'ParameterDefinition.name', 'min'=>0, 'max'=>1},
      'use' => {'type'=>'code', 'path'=>'ParameterDefinition.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/operation-parameter-use|4.0.0', 'uri'=>nil}},
      'min' => {'type'=>'integer', 'path'=>'ParameterDefinition.min', 'min'=>0, 'max'=>1},
      'max' => {'type'=>'string', 'path'=>'ParameterDefinition.max', 'min'=>0, 'max'=>1},
      'documentation' => {'type'=>'string', 'path'=>'ParameterDefinition.documentation', 'min'=>0, 'max'=>1},
      'type' => {'type'=>'code', 'path'=>'ParameterDefinition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/all-types|4.0.0', 'uri'=>nil}},
      'profile' => {'type'=>'canonical', 'path'=>'ParameterDefinition.profile', 'min'=>0, 'max'=>1}
    }

    attr_accessor :id            # 0-1 string
    attr_accessor :extension     # 0-* [ Extension ]
    attr_accessor :name          # 0-1 code
    attr_accessor :use           # 1-1 code
    attr_accessor :min           # 0-1 integer
    attr_accessor :max           # 0-1 string
    attr_accessor :documentation # 0-1 string
    attr_accessor :type          # 1-1 code
    attr_accessor :profile       # 0-1 canonical
  end
end