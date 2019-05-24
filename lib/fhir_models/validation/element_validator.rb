module FHIR
  # Element Validators accept an ElementDefinition and the associated element of the resource being validated.
  module ElementValidator
    # Verify that the element meets the cardinality requirements
    #
    # @param element [Object] The Element of the Resource under test
    # @param element_definition [FHIR::ElementDefinition] The Element Definition from which the cardinality is taken
    # @return result [FHIR::ValidationResult] The result of the cardinality check
    def self.verify_element_cardinality(element, element_definition, current_path, skip = false)
      min = element_definition.min
      max = element_definition.max == '*' ? Float::INFINITY : element_definition.max.to_i
      result = FHIR::ValidationResult.new
      # Save a reference to the ElementDefinition
      result.element_definition = element_definition
      result.validation_type = :cardinality

      # Cardinality has no meaning on the first element.
      # It is listed as optional(irrelevant)
      # Specification Reference: http://www.hl7.org/fhir/elementdefinition.html#interpretation
      # Zulip Chat: https://chat.fhir.org/#narrow/stream/179166-implementers/topic/cardinality.20of.20root.20elements/near/154024550
      if skip || !current_path.include?('.')
        result.is_successful = :skipped
        result.element_path = current_path || element_definition.path
        return result
      end
      result.element_path = current_path
      result.element = element
      element_array = [element].flatten.compact # flatten
      result.is_successful = !((element_array.size < min) || (element_array.size > max))
      result
    end

    def self.verify_data_type(element, element_definition, current_path, skip = false)
      element_definition.type.code.each do |datatype|
        if FHIR::RESOURCES.include? datatype

        end
      end
    end
  end
end