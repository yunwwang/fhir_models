module FHIR
  # Extend ElementDefinition for profile validation code
  class ElementDefinition < FHIR::Model
    # If the element has a choice of types
    # @return [Boolean]
    def choice_type?
      path&.end_with? '[x]'
    end

    # Returns the type code
    # @param path [String] The path of the element in the resource.  Needed to determine the type of elements with a choice of types.
    def type_code(element_path = nil)
      if type.one?
        type.first.code
      else
        raise UnknownType, 'Need path in order to determine type' unless element_path

        matching_code = type.find do |datatype|
          /[^.]+$/.match(path.gsub('[x]', capitalize(datatype))).to_s == /[^.]+$/.match(element_path).to_s
        end&.code

        raise UnknownType, "No matching types from #{type.flat_map(&:code)} for element at #{element_path}" if matching_code.nil?

        matching_code
      end
    end

    # Returns the potential paths of the element for each possible type
    # @return type_paths [Array<String>] the possible paths
    def type_paths
      type.map do |data_type|
        path.gsub('[x]', capitalize(data_type))
      end
    end

    private def capitalize(string)
      "#{string.code[0].capitalize}#{string.code[1..-1]}"
    end
  end
  # Error for Unknown Types
  class UnknownType < StandardError
    def initialize(msg = 'Unknown TypeCode')
      super(msg)
    end
  end
end
