module FHIR
  class ClaimResponse < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['created', 'disposition', 'identifier', 'insurer', 'outcome', 'patient', 'payment-date', 'request', 'requestor', 'status', 'use']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ClaimResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ClaimResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ClaimResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ClaimResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}},
      'text' => {'type'=>'Narrative', 'path'=>'ClaimResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ClaimResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ClaimResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ClaimResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ClaimResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'type'=>'code', 'path'=>'ClaimResponse.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/fm-status|4.0.0', 'uri'=>nil}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'ClaimResponse.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-type', 'uri'=>nil}},
      'subType' => {'type'=>'CodeableConcept', 'path'=>'ClaimResponse.subType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-subtype', 'uri'=>nil}},
      'use' => {'type'=>'code', 'path'=>'ClaimResponse.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/claim-use|4.0.0', 'uri'=>nil}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ClaimResponse.patient', 'min'=>1, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'ClaimResponse.created', 'min'=>1, 'max'=>1},
      'insurer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ClaimResponse.insurer', 'min'=>1, 'max'=>1},
      'requestor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ClaimResponse.requestor', 'min'=>0, 'max'=>1},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'ClaimResponse.request', 'min'=>0, 'max'=>1},
      'outcome' => {'type'=>'code', 'path'=>'ClaimResponse.outcome', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'valueSet'=>'http://hl7.org/fhir/ValueSet/remittance-outcome|4.0.0', 'uri'=>nil}},
      'disposition' => {'type'=>'string', 'path'=>'ClaimResponse.disposition', 'min'=>0, 'max'=>1},
      'preAuthRef' => {'type'=>'string', 'path'=>'ClaimResponse.preAuthRef', 'min'=>0, 'max'=>1},
      'preAuthPeriod' => {'type'=>'Period', 'path'=>'ClaimResponse.preAuthPeriod', 'min'=>0, 'max'=>1},
      'payeeType' => {'type'=>'CodeableConcept', 'path'=>'ClaimResponse.payeeType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/payeetype', 'uri'=>nil}},
      'item' => {'type'=>'ClaimResponse::Item', 'path'=>'ClaimResponse.item', 'min'=>0, 'max'=>Float::INFINITY},
      'addItem' => {'type'=>'ClaimResponse::AddItem', 'path'=>'ClaimResponse.addItem', 'min'=>0, 'max'=>Float::INFINITY},
      'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'ClaimResponse.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
      'total' => {'type'=>'ClaimResponse::Total', 'path'=>'ClaimResponse.total', 'min'=>0, 'max'=>Float::INFINITY},
      'payment' => {'type'=>'ClaimResponse::Payment', 'path'=>'ClaimResponse.payment', 'min'=>0, 'max'=>1},
      'fundsReserve' => {'type'=>'CodeableConcept', 'path'=>'ClaimResponse.fundsReserve', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/fundsreserve', 'uri'=>nil}},
      'formCode' => {'type'=>'CodeableConcept', 'path'=>'ClaimResponse.formCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/forms', 'uri'=>nil}},
      'form' => {'type'=>'Attachment', 'path'=>'ClaimResponse.form', 'min'=>0, 'max'=>1},
      'processNote' => {'type'=>'ClaimResponse::ProcessNote', 'path'=>'ClaimResponse.processNote', 'min'=>0, 'max'=>Float::INFINITY},
      'communicationRequest' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CommunicationRequest'], 'type'=>'Reference', 'path'=>'ClaimResponse.communicationRequest', 'min'=>0, 'max'=>Float::INFINITY},
      'insurance' => {'type'=>'ClaimResponse::Insurance', 'path'=>'ClaimResponse.insurance', 'min'=>0, 'max'=>Float::INFINITY},
      'error' => {'type'=>'ClaimResponse::Error', 'path'=>'ClaimResponse.error', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Item < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'itemSequence' => {'type'=>'positiveInt', 'path'=>'Item.itemSequence', 'min'=>1, 'max'=>1},
        'noteNumber' => {'type'=>'positiveInt', 'path'=>'Item.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
        'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Item.adjudication', 'min'=>1, 'max'=>Float::INFINITY},
        'detail' => {'type'=>'ClaimResponse::Item::Detail', 'path'=>'Item.detail', 'min'=>0, 'max'=>Float::INFINITY}
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
          'detailSequence' => {'type'=>'positiveInt', 'path'=>'Detail.detailSequence', 'min'=>1, 'max'=>1},
          'noteNumber' => {'type'=>'positiveInt', 'path'=>'Detail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Detail.adjudication', 'min'=>1, 'max'=>Float::INFINITY},
          'subDetail' => {'type'=>'ClaimResponse::Item::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class SubDetail < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'subDetailSequence' => {'type'=>'positiveInt', 'path'=>'SubDetail.subDetailSequence', 'min'=>1, 'max'=>1},
            'noteNumber' => {'type'=>'positiveInt', 'path'=>'SubDetail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'SubDetail.adjudication', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :subDetailSequence # 1-1 positiveInt
          attr_accessor :noteNumber        # 0-* [ positiveInt ]
          attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :detailSequence    # 1-1 positiveInt
        attr_accessor :noteNumber        # 0-* [ positiveInt ]
        attr_accessor :adjudication      # 1-* [ ClaimResponse::Item::Adjudication ]
        attr_accessor :subDetail         # 0-* [ ClaimResponse::Item::Detail::SubDetail ]
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :itemSequence      # 1-1 positiveInt
      attr_accessor :noteNumber        # 0-* [ positiveInt ]
      attr_accessor :adjudication      # 1-* [ ClaimResponse::Item::Adjudication ]
      attr_accessor :detail            # 0-* [ ClaimResponse::Item::Detail ]
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
        'subdetailSequence' => {'type'=>'positiveInt', 'path'=>'AddItem.subdetailSequence', 'min'=>0, 'max'=>Float::INFINITY},
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
        'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'AddItem.adjudication', 'min'=>1, 'max'=>Float::INFINITY},
        'detail' => {'type'=>'ClaimResponse::AddItem::Detail', 'path'=>'AddItem.detail', 'min'=>0, 'max'=>Float::INFINITY}
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
          'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Detail.adjudication', 'min'=>1, 'max'=>Float::INFINITY},
          'subDetail' => {'type'=>'ClaimResponse::AddItem::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
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
            'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'SubDetail.adjudication', 'min'=>1, 'max'=>Float::INFINITY}
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
          attr_accessor :adjudication      # 1-* [ ClaimResponse::Item::Adjudication ]
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
        attr_accessor :adjudication      # 1-* [ ClaimResponse::Item::Adjudication ]
        attr_accessor :subDetail         # 0-* [ ClaimResponse::AddItem::Detail::SubDetail ]
      end

      attr_accessor :id                      # 0-1 string
      attr_accessor :extension               # 0-* [ Extension ]
      attr_accessor :modifierExtension       # 0-* [ Extension ]
      attr_accessor :itemSequence            # 0-* [ positiveInt ]
      attr_accessor :detailSequence          # 0-* [ positiveInt ]
      attr_accessor :subdetailSequence       # 0-* [ positiveInt ]
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
      attr_accessor :adjudication            # 1-* [ ClaimResponse::Item::Adjudication ]
      attr_accessor :detail                  # 0-* [ ClaimResponse::AddItem::Detail ]
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
        'type' => {'type'=>'CodeableConcept', 'path'=>'Payment.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/ex-paymenttype', 'uri'=>nil}},
        'adjustment' => {'type'=>'Money', 'path'=>'Payment.adjustment', 'min'=>0, 'max'=>1},
        'adjustmentReason' => {'type'=>'CodeableConcept', 'path'=>'Payment.adjustmentReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/payment-adjustment-reason', 'uri'=>nil}},
        'date' => {'type'=>'date', 'path'=>'Payment.date', 'min'=>0, 'max'=>1},
        'amount' => {'type'=>'Money', 'path'=>'Payment.amount', 'min'=>1, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'Payment.identifier', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :adjustment        # 0-1 Money
      attr_accessor :adjustmentReason  # 0-1 CodeableConcept
      attr_accessor :date              # 0-1 date
      attr_accessor :amount            # 1-1 Money
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
        'text' => {'type'=>'string', 'path'=>'ProcessNote.text', 'min'=>1, 'max'=>1},
        'language' => {'type'=>'CodeableConcept', 'path'=>'ProcessNote.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :number            # 0-1 positiveInt
      attr_accessor :type              # 0-1 code
      attr_accessor :text              # 1-1 string
      attr_accessor :language          # 0-1 CodeableConcept
    end

    class Insurance < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Insurance.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Insurance.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Insurance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Insurance.sequence', 'min'=>1, 'max'=>1},
        'focal' => {'type'=>'boolean', 'path'=>'Insurance.focal', 'min'=>1, 'max'=>1},
        'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Insurance.coverage', 'min'=>1, 'max'=>1},
        'businessArrangement' => {'type'=>'string', 'path'=>'Insurance.businessArrangement', 'min'=>0, 'max'=>1},
        'claimResponse' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Insurance.claimResponse', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :sequence            # 1-1 positiveInt
      attr_accessor :focal               # 1-1 boolean
      attr_accessor :coverage            # 1-1 Reference(Coverage)
      attr_accessor :businessArrangement # 0-1 string
      attr_accessor :claimResponse       # 0-1 Reference(ClaimResponse)
    end

    class Error < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Error.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Error.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Error.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'itemSequence' => {'type'=>'positiveInt', 'path'=>'Error.itemSequence', 'min'=>0, 'max'=>1},
        'detailSequence' => {'type'=>'positiveInt', 'path'=>'Error.detailSequence', 'min'=>0, 'max'=>1},
        'subDetailSequence' => {'type'=>'positiveInt', 'path'=>'Error.subDetailSequence', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Error.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'valueSet'=>'http://hl7.org/fhir/ValueSet/adjudication-error', 'uri'=>nil}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :itemSequence      # 0-1 positiveInt
      attr_accessor :detailSequence    # 0-1 positiveInt
      attr_accessor :subDetailSequence # 0-1 positiveInt
      attr_accessor :code              # 1-1 CodeableConcept
    end

    attr_accessor :id                   # 0-1 id
    attr_accessor :meta                 # 0-1 Meta
    attr_accessor :implicitRules        # 0-1 uri
    attr_accessor :language             # 0-1 code
    attr_accessor :text                 # 0-1 Narrative
    attr_accessor :contained            # 0-* [ Resource ]
    attr_accessor :extension            # 0-* [ Extension ]
    attr_accessor :modifierExtension    # 0-* [ Extension ]
    attr_accessor :identifier           # 0-* [ Identifier ]
    attr_accessor :status               # 1-1 code
    attr_accessor :type                 # 1-1 CodeableConcept
    attr_accessor :subType              # 0-1 CodeableConcept
    attr_accessor :use                  # 1-1 code
    attr_accessor :patient              # 1-1 Reference(Patient)
    attr_accessor :created              # 1-1 dateTime
    attr_accessor :insurer              # 1-1 Reference(Organization)
    attr_accessor :requestor            # 0-1 Reference(Practitioner|PractitionerRole|Organization)
    attr_accessor :request              # 0-1 Reference(Claim)
    attr_accessor :outcome              # 1-1 code
    attr_accessor :disposition          # 0-1 string
    attr_accessor :preAuthRef           # 0-1 string
    attr_accessor :preAuthPeriod        # 0-1 Period
    attr_accessor :payeeType            # 0-1 CodeableConcept
    attr_accessor :item                 # 0-* [ ClaimResponse::Item ]
    attr_accessor :addItem              # 0-* [ ClaimResponse::AddItem ]
    attr_accessor :adjudication         # 0-* [ ClaimResponse::Item::Adjudication ]
    attr_accessor :total                # 0-* [ ClaimResponse::Total ]
    attr_accessor :payment              # 0-1 ClaimResponse::Payment
    attr_accessor :fundsReserve         # 0-1 CodeableConcept
    attr_accessor :formCode             # 0-1 CodeableConcept
    attr_accessor :form                 # 0-1 Attachment
    attr_accessor :processNote          # 0-* [ ClaimResponse::ProcessNote ]
    attr_accessor :communicationRequest # 0-* [ Reference(CommunicationRequest) ]
    attr_accessor :insurance            # 0-* [ ClaimResponse::Insurance ]
    attr_accessor :error                # 0-* [ ClaimResponse::Error ]

    def resourceType
      'ClaimResponse'
    end
  end
end