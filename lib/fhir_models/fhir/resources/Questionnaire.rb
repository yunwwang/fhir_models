module FHIR
  class Questionnaire < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['code', 'context', 'context-quantity', 'context-type', 'date', 'definition', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'subject-type', 'title', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Questionnaire.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Questionnaire.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Questionnaire.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Questionnaire.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'Questionnaire.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Questionnaire.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Questionnaire.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Questionnaire.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'Questionnaire.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'Questionnaire.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'Questionnaire.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'Questionnaire.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'Questionnaire.title', 'min'=>0, 'max'=>1},
      'derivedFrom' => {'type'=>'canonical', 'path'=>'Questionnaire.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'Questionnaire.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/publication-status|4.0.0', 'uri'=>nil}},
      'experimental' => {'type'=>'boolean', 'path'=>'Questionnaire.experimental', 'min'=>0, 'max'=>1},
      'subjectType' => {'type'=>'code', 'path'=>'Questionnaire.subjectType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/resource-types|4.0.0', 'uri'=>nil}},
      'date' => {'type'=>'dateTime', 'path'=>'Questionnaire.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'Questionnaire.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'Questionnaire.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'Questionnaire.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'Questionnaire.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'type'=>'CodeableConcept', 'path'=>'Questionnaire.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/jurisdiction', 'uri'=>nil}},
      'purpose' => {'type'=>'markdown', 'path'=>'Questionnaire.purpose', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'markdown', 'path'=>'Questionnaire.copyright', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'Questionnaire.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'Questionnaire.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'Questionnaire.effectivePeriod', 'min'=>0, 'max'=>1},
      'code' => {'type'=>'Coding', 'path'=>'Questionnaire.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/questionnaire-questions', 'uri'=>nil}},
      'item' => {'type'=>'Questionnaire::Item', 'path'=>'Questionnaire.item', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Item < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'linkId' => {'type'=>'string', 'path'=>'Item.linkId', 'min'=>1, 'max'=>1},
        'definition' => {'type'=>'uri', 'path'=>'Item.definition', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'Coding', 'path'=>'Item.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/questionnaire-questions', 'uri'=>nil}},
        'prefix' => {'type'=>'string', 'path'=>'Item.prefix', 'min'=>0, 'max'=>1},
        'text' => {'type'=>'string', 'path'=>'Item.text', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'code', 'path'=>'Item.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/item-type|4.0.0', 'uri'=>nil}},
        'enableWhen' => {'type'=>'Questionnaire::Item::EnableWhen', 'path'=>'Item.enableWhen', 'min'=>0, 'max'=>Float::INFINITY},
        'enableBehavior' => {'type'=>'code', 'path'=>'Item.enableBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/questionnaire-enable-behavior|4.0.0', 'uri'=>nil}},
        'required' => {'type'=>'boolean', 'path'=>'Item.required', 'min'=>0, 'max'=>1},
        'repeats' => {'type'=>'boolean', 'path'=>'Item.repeats', 'min'=>0, 'max'=>1},
        'readOnly' => {'type'=>'boolean', 'path'=>'Item.readOnly', 'min'=>0, 'max'=>1},
        'maxLength' => {'type'=>'integer', 'path'=>'Item.maxLength', 'min'=>0, 'max'=>1},
        'answerValueSet' => {'type'=>'canonical', 'path'=>'Item.answerValueSet', 'min'=>0, 'max'=>1},
        'answerOption' => {'type'=>'Questionnaire::Item::AnswerOption', 'path'=>'Item.answerOption', 'min'=>0, 'max'=>Float::INFINITY},
        'initial' => {'type'=>'Questionnaire::Item::Initial', 'path'=>'Item.initial', 'min'=>0, 'max'=>Float::INFINITY},
        'item' => {'type'=>'Questionnaire::Item', 'path'=>'Item.item', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class EnableWhen < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'answer' => ['boolean', 'decimal', 'integer', 'date', 'dateTime', 'time', 'string', 'Coding', 'Quantity', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'EnableWhen.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'EnableWhen.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'EnableWhen.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'question' => {'type'=>'string', 'path'=>'EnableWhen.question', 'min'=>1, 'max'=>1},
          'operator' => {'type'=>'code', 'path'=>'EnableWhen.operator', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/questionnaire-enable-operator|4.0.0', 'uri'=>nil}},
          'answerBoolean' => {'type'=>'boolean', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerDecimal' => {'type'=>'decimal', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerInteger' => {'type'=>'integer', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerDate' => {'type'=>'date', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerDateTime' => {'type'=>'dateTime', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerTime' => {'type'=>'time', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerString' => {'type'=>'string', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerCoding' => {'type'=>'Coding', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/questionnaire-answers', 'uri'=>nil}},
          'answerQuantity' => {'type'=>'Quantity', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :question          # 1-1 string
        attr_accessor :operator          # 1-1 code
        attr_accessor :answerBoolean     # 1-1 boolean
        attr_accessor :answerDecimal     # 1-1 decimal
        attr_accessor :answerInteger     # 1-1 integer
        attr_accessor :answerDate        # 1-1 date
        attr_accessor :answerDateTime    # 1-1 dateTime
        attr_accessor :answerTime        # 1-1 time
        attr_accessor :answerString      # 1-1 string
        attr_accessor :answerCoding      # 1-1 Coding
        attr_accessor :answerQuantity    # 1-1 Quantity
        attr_accessor :answerReference   # 1-1 Reference(Resource)
      end

      class AnswerOption < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['integer', 'date', 'time', 'string', 'Coding', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'AnswerOption.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'AnswerOption.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'AnswerOption.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'valueInteger' => {'type'=>'integer', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'valueDate' => {'type'=>'date', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'valueTime' => {'type'=>'time', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'valueCoding' => {'type'=>'Coding', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/questionnaire-answers', 'uri'=>nil}},
          'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'initialSelected' => {'type'=>'boolean', 'path'=>'AnswerOption.initialSelected', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :valueInteger      # 1-1 integer
        attr_accessor :valueDate         # 1-1 date
        attr_accessor :valueTime         # 1-1 time
        attr_accessor :valueString       # 1-1 string
        attr_accessor :valueCoding       # 1-1 Coding
        attr_accessor :valueReference    # 1-1 Reference(Resource)
        attr_accessor :initialSelected   # 0-1 boolean
      end

      class Initial < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['boolean', 'decimal', 'integer', 'date', 'dateTime', 'time', 'string', 'uri', 'Attachment', 'Coding', 'Quantity', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Initial.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Initial.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Initial.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueDecimal' => {'type'=>'decimal', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueDate' => {'type'=>'date', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueTime' => {'type'=>'time', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueUri' => {'type'=>'uri', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueAttachment' => {'type'=>'Attachment', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueCoding' => {'type'=>'Coding', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/questionnaire-answers', 'uri'=>nil}},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :valueBoolean      # 1-1 boolean
        attr_accessor :valueDecimal      # 1-1 decimal
        attr_accessor :valueInteger      # 1-1 integer
        attr_accessor :valueDate         # 1-1 date
        attr_accessor :valueDateTime     # 1-1 dateTime
        attr_accessor :valueTime         # 1-1 time
        attr_accessor :valueString       # 1-1 string
        attr_accessor :valueUri          # 1-1 uri
        attr_accessor :valueAttachment   # 1-1 Attachment
        attr_accessor :valueCoding       # 1-1 Coding
        attr_accessor :valueQuantity     # 1-1 Quantity
        attr_accessor :valueReference    # 1-1 Reference(Resource)
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :linkId            # 1-1 string
      attr_accessor :definition        # 0-1 uri
      attr_accessor :code              # 0-* [ Coding ]
      attr_accessor :prefix            # 0-1 string
      attr_accessor :text              # 0-1 string
      attr_accessor :type              # 1-1 code
      attr_accessor :enableWhen        # 0-* [ Questionnaire::Item::EnableWhen ]
      attr_accessor :enableBehavior    # 0-1 code
      attr_accessor :required          # 0-1 boolean
      attr_accessor :repeats           # 0-1 boolean
      attr_accessor :readOnly          # 0-1 boolean
      attr_accessor :maxLength         # 0-1 integer
      attr_accessor :answerValueSet    # 0-1 canonical
      attr_accessor :answerOption      # 0-* [ Questionnaire::Item::AnswerOption ]
      attr_accessor :initial           # 0-* [ Questionnaire::Item::Initial ]
      attr_accessor :item              # 0-* [ Questionnaire::Item ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :url               # 0-1 uri
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 0-1 string
    attr_accessor :title             # 0-1 string
    attr_accessor :derivedFrom       # 0-* [ canonical ]
    attr_accessor :status            # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :subjectType       # 0-* [ code ]
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ ContactDetail ]
    attr_accessor :description       # 0-1 markdown
    attr_accessor :useContext        # 0-* [ UsageContext ]
    attr_accessor :jurisdiction      # 0-* [ CodeableConcept ]
    attr_accessor :purpose           # 0-1 markdown
    attr_accessor :copyright         # 0-1 markdown
    attr_accessor :approvalDate      # 0-1 date
    attr_accessor :lastReviewDate    # 0-1 date
    attr_accessor :effectivePeriod   # 0-1 Period
    attr_accessor :code              # 0-* [ Coding ]
    attr_accessor :item              # 0-* [ Questionnaire::Item ]

    def resourceType
      'Questionnaire'
    end
  end
end