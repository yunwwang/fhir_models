module FHIR
  class Meta < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = 
    METADATA = {
      'id' => {'type'=>'string', 'path'=>'Meta.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'Meta.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'versionId' => {'type'=>'id', 'path'=>'Meta.versionId', 'min'=>0, 'max'=>1},
      'lastUpdated' => {'type'=>'instant', 'path'=>'Meta.lastUpdated', 'min'=>0, 'max'=>1},
      'source' => {'type'=>'uri', 'path'=>'Meta.source', 'min'=>0, 'max'=>1},
      'profile' => {'type'=>'canonical', 'path'=>'Meta.profile', 'min'=>0, 'max'=>Float::INFINITY},
      'security' => {'type'=>'Coding', 'path'=>'Meta.security', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/security-labels', 'uri'=>nil}},
      'tag' => {'type'=>'Coding', 'path'=>'Meta.tag', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/common-tags', 'uri'=>nil}}
    }

    attr_accessor :id          # 0-1 string
    attr_accessor :extension   # 0-* [ Extension ]
    attr_accessor :versionId   # 0-1 id
    attr_accessor :lastUpdated # 0-1 instant
    attr_accessor :source      # 0-1 uri
    attr_accessor :profile     # 0-* [ canonical ]
    attr_accessor :security    # 0-* [ Coding ]
    attr_accessor :tag         # 0-* [ Coding ]
  end
end