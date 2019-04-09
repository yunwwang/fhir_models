module FHIR
  class ImplementationGuide < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'date', 'description', 'jurisdiction', 'name', 'publisher', 'status', 'title', 'url', 'version', 'depends-on', 'experimental', 'global', 'resource']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ImplementationGuide.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ImplementationGuide.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ImplementationGuide.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ImplementationGuide.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ImplementationGuide.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ImplementationGuide.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ImplementationGuide.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ImplementationGuide.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'ImplementationGuide.url', 'min'=>1, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'ImplementationGuide.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'ImplementationGuide.name', 'min'=>1, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'ImplementationGuide.title', 'min'=>0, 'max'=>1},
      'status' => {'type'=>'code', 'path'=>'ImplementationGuide.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status|4.0.0'}},
      'experimental' => {'type'=>'boolean', 'path'=>'ImplementationGuide.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ImplementationGuide.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'ImplementationGuide.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'ImplementationGuide.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'ImplementationGuide.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'ImplementationGuide.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>[], 'urn:iso:std:iso:3166:-2'=>[], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>[]}, 'type'=>'CodeableConcept', 'path'=>'ImplementationGuide.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'copyright' => {'type'=>'markdown', 'path'=>'ImplementationGuide.copyright', 'min'=>0, 'max'=>1},
      'packageId' => {'type'=>'id', 'path'=>'ImplementationGuide.packageId', 'min'=>1, 'max'=>1},
      'license' => {'type'=>'code', 'path'=>'ImplementationGuide.license', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/spdx-license|4.0.0'}},
      'fhirVersion' => {'type'=>'code', 'path'=>'ImplementationGuide.fhirVersion', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/FHIR-version|4.0.0'}},
      'dependsOn' => {'type'=>'ImplementationGuide::DependsOn', 'path'=>'ImplementationGuide.dependsOn', 'min'=>0, 'max'=>Float::INFINITY},
      'global' => {'type'=>'ImplementationGuide::Global', 'path'=>'ImplementationGuide.global', 'min'=>0, 'max'=>Float::INFINITY},
      'definition' => {'type'=>'ImplementationGuide::Definition', 'path'=>'ImplementationGuide.definition', 'min'=>0, 'max'=>1},
      'manifest' => {'type'=>'ImplementationGuide::Manifest', 'path'=>'ImplementationGuide.manifest', 'min'=>0, 'max'=>1}
    }

    class DependsOn < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DependsOn.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DependsOn.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DependsOn.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'uri' => {'type'=>'canonical', 'path'=>'DependsOn.uri', 'min'=>1, 'max'=>1},
        'packageId' => {'type'=>'id', 'path'=>'DependsOn.packageId', 'min'=>0, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'DependsOn.version', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :uri               # 1-1 canonical
      attr_accessor :packageId         # 0-1 id
      attr_accessor :version           # 0-1 string
    end

    class Global < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Global.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Global.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Global.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'code', 'path'=>'Global.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types|4.0.0'}},
        'profile' => {'type'=>'canonical', 'path'=>'Global.profile', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :profile           # 1-1 canonical
    end

    class Definition < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Definition.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Definition.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Definition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'grouping' => {'type'=>'ImplementationGuide::Definition::Grouping', 'path'=>'Definition.grouping', 'min'=>0, 'max'=>Float::INFINITY},
        'resource' => {'type'=>'ImplementationGuide::Definition::Resource', 'path'=>'Definition.resource', 'min'=>1, 'max'=>Float::INFINITY},
        'page' => {'type'=>'ImplementationGuide::Definition::Page', 'path'=>'Definition.page', 'min'=>0, 'max'=>1},
        'parameter' => {'type'=>'ImplementationGuide::Definition::Parameter', 'path'=>'Definition.parameter', 'min'=>0, 'max'=>Float::INFINITY},
        'template' => {'type'=>'ImplementationGuide::Definition::Template', 'path'=>'Definition.template', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Grouping < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Grouping.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Grouping.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Grouping.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Grouping.name', 'min'=>1, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Grouping.description', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 string
        attr_accessor :description       # 0-1 string
      end

      class Resource < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'example' => ['boolean', 'canonical']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Resource.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Resource.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Resource.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Resource.reference', 'min'=>1, 'max'=>1},
          'fhirVersion' => {'type'=>'code', 'path'=>'Resource.fhirVersion', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/FHIR-version|4.0.0'}},
          'name' => {'type'=>'string', 'path'=>'Resource.name', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Resource.description', 'min'=>0, 'max'=>1},
          'exampleBoolean' => {'type'=>'boolean', 'path'=>'Resource.example[x]', 'min'=>0, 'max'=>1},
          'exampleCanonical' => {'type'=>'canonical', 'path'=>'Resource.example[x]', 'min'=>0, 'max'=>1},
          'groupingId' => {'type'=>'id', 'path'=>'Resource.groupingId', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :reference         # 1-1 Reference(Resource)
        attr_accessor :fhirVersion       # 0-* [ code ]
        attr_accessor :name              # 0-1 string
        attr_accessor :description       # 0-1 string
        attr_accessor :exampleBoolean    # 0-1 boolean
        attr_accessor :exampleCanonical  # 0-1 canonical
        attr_accessor :groupingId        # 0-1 id
      end

      class Page < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'name' => ['url', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Page.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Page.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Page.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'nameUrl' => {'type'=>'url', 'path'=>'Page.name[x]', 'min'=>1, 'max'=>1},
          'nameReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Binary'], 'type'=>'Reference', 'path'=>'Page.name[x]', 'min'=>1, 'max'=>1},
          'title' => {'type'=>'string', 'path'=>'Page.title', 'min'=>1, 'max'=>1},
          'generation' => {'type'=>'code', 'path'=>'Page.generation', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/guide-page-generation|4.0.0'}},
          'page' => {'type'=>'ImplementationGuide::Definition::Page', 'path'=>'Page.page', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :nameUrl           # 1-1 url
        attr_accessor :nameReference     # 1-1 Reference(Binary)
        attr_accessor :title             # 1-1 string
        attr_accessor :generation        # 1-1 code
        attr_accessor :page              # 0-* [ ImplementationGuide::Definition::Page ]
      end

      class Parameter < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'type'=>'code', 'path'=>'Parameter.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/guide-parameter-code|4.0.0'}},
          'value' => {'type'=>'string', 'path'=>'Parameter.value', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 code
        attr_accessor :value             # 1-1 string
      end

      class Template < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Template.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Template.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Template.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'type'=>'code', 'path'=>'Template.code', 'min'=>1, 'max'=>1},
          'source' => {'type'=>'string', 'path'=>'Template.source', 'min'=>1, 'max'=>1},
          'scope' => {'type'=>'string', 'path'=>'Template.scope', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 code
        attr_accessor :source            # 1-1 string
        attr_accessor :scope             # 0-1 string
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :grouping          # 0-* [ ImplementationGuide::Definition::Grouping ]
      attr_accessor :resource          # 1-* [ ImplementationGuide::Definition::Resource ]
      attr_accessor :page              # 0-1 ImplementationGuide::Definition::Page
      attr_accessor :parameter         # 0-* [ ImplementationGuide::Definition::Parameter ]
      attr_accessor :template          # 0-* [ ImplementationGuide::Definition::Template ]
    end

    class Manifest < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Manifest.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Manifest.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Manifest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'rendering' => {'type'=>'url', 'path'=>'Manifest.rendering', 'min'=>0, 'max'=>1},
        'resource' => {'type'=>'ImplementationGuide::Manifest::Resource', 'path'=>'Manifest.resource', 'min'=>1, 'max'=>Float::INFINITY},
        'page' => {'type'=>'ImplementationGuide::Manifest::Page', 'path'=>'Manifest.page', 'min'=>0, 'max'=>Float::INFINITY},
        'image' => {'type'=>'string', 'path'=>'Manifest.image', 'min'=>0, 'max'=>Float::INFINITY},
        'other' => {'type'=>'string', 'path'=>'Manifest.other', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Resource < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'example' => ['boolean', 'canonical']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Resource.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Resource.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Resource.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Resource.reference', 'min'=>1, 'max'=>1},
          'exampleBoolean' => {'type'=>'boolean', 'path'=>'Resource.example[x]', 'min'=>0, 'max'=>1},
          'exampleCanonical' => {'type'=>'canonical', 'path'=>'Resource.example[x]', 'min'=>0, 'max'=>1},
          'relativePath' => {'type'=>'url', 'path'=>'Resource.relativePath', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :reference         # 1-1 Reference(Resource)
        attr_accessor :exampleBoolean    # 0-1 boolean
        attr_accessor :exampleCanonical  # 0-1 canonical
        attr_accessor :relativePath      # 0-1 url
      end

      class Page < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Page.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Page.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Page.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Page.name', 'min'=>1, 'max'=>1},
          'title' => {'type'=>'string', 'path'=>'Page.title', 'min'=>0, 'max'=>1},
          'anchor' => {'type'=>'string', 'path'=>'Page.anchor', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 string
        attr_accessor :title             # 0-1 string
        attr_accessor :anchor            # 0-* [ string ]
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :rendering         # 0-1 url
      attr_accessor :resource          # 1-* [ ImplementationGuide::Manifest::Resource ]
      attr_accessor :page              # 0-* [ ImplementationGuide::Manifest::Page ]
      attr_accessor :image             # 0-* [ string ]
      attr_accessor :other             # 0-* [ string ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :url               # 1-1 uri
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 1-1 string
    attr_accessor :title             # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ ContactDetail ]
    attr_accessor :description       # 0-1 markdown
    attr_accessor :useContext        # 0-* [ UsageContext ]
    attr_accessor :jurisdiction      # 0-* [ CodeableConcept ]
    attr_accessor :copyright         # 0-1 markdown
    attr_accessor :packageId         # 1-1 id
    attr_accessor :license           # 0-1 code
    attr_accessor :fhirVersion       # 1-* [ code ]
    attr_accessor :dependsOn         # 0-* [ ImplementationGuide::DependsOn ]
    attr_accessor :global            # 0-* [ ImplementationGuide::Global ]
    attr_accessor :definition        # 0-1 ImplementationGuide::Definition
    attr_accessor :manifest          # 0-1 ImplementationGuide::Manifest

    def resourceType
      'ImplementationGuide'
    end
  end
end