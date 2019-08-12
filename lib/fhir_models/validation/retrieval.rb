module FHIR
  module Validation
    # Methods for retrieving elements from resources
    module Retrieval
      # Retrieves all the elements associated with the given path with the FHIRPath of the element
      #
      # @param path [String] the path
      # @param resource [FHIR::Model] the resource from which the elements will be retrieved
      # @return [Hash] The desired elements
      def self.retrieve_by_fhirpath(path, resource, indexed = true)
        path_parts = path_parts(path)
        last = path_parts.pop if path_parts.length != 1 && !indexed

        desired_elements = indexed_elements_by_fhirpath(path_parts.join('.'), resource)

        return desired_elements unless last

        # If we don't want to index the last element (useful for testing cardinality)
        not_indexed = {}
        desired_elements.each do |current_path, element|
          not_indexed["#{current_path}.#{last}"] = retrieve_from_structure(last, element)
        end
        not_indexed
      end

      # Returns an array of the path parts
      # @param path [String] the path
      # @return [Array<String>]
      def self.path_parts(path)
        path.split('.')
      end

      # Retrieve the specified element from the structure
      #
      # @param element [String] the element to be retrieved
      # @param structure [FHIR::Model] the structure from which the element will be retrieved
      def self.retrieve_from_structure(element, structure)
        fixed_name = %w[class method resourceType].include?(element) ? "local_#{element}" : element
        structure.send(fixed_name) if structure.is_a? FHIR::Model # FHIR Primitives are not modeled and will throw NoMethod Error
      end

      # Returns the indexed elements given by the path
      #
      # @param fhirpath ['String'] the element path
      # @resource [FHIR::Model] the resource from which the elements will be retrieved
      # @return [Hash]
      def self.indexed_elements_by_fhirpath(fhirpath, resource)
        path_parts = path_parts(fhirpath)
        base_path = path_parts.shift
        fhir_path_elements = { base_path => resource }
        path_parts.reduce(fhir_path_elements) do |path_resource_map, sub_path|
          children = {}
          path_resource_map.each do |path, element|
            elements = retrieve_from_structure(sub_path, element)
            if elements.respond_to? :each_with_index
              elements.each_with_index do |indexed_element_value, indexed_element_path|
                children["#{path}.#{sub_path}[#{indexed_element_path}]"] = indexed_element_value unless blank?(indexed_element_value)
              end
            else
              children["#{path}.#{sub_path}"] = elements unless blank?(elements)
            end
          end
          children
        end
      end

      # Retrieve the elements in the resource which are defined by the provided ElementDefinition
      #
      # @param resource [FHIR::Model] The resource from which the elements will be retrieved
      # @param element_definition [FHIR::ElementDefinition] The ElementDefinition which defines the desired resources
      # @param indexed [Boolean] If the elements should be returned individually or as a collection
      # @param normalized [Boolean] If the elements with a choice of type should be normalized
      def self.retrieve_by_element_definition(resource, element_definition, indexed: false, normalized: false)
        # Check if we were provided a path that includes extensions (like in the ElementDefinition id versus the path)
        path = element_definition.path

        # Check for multiple choice types
        if element_definition.choice_type?
          elements = {}
          element_definition.type.each do |type|
            choice_type = type.code[0].upcase + type.code[1..-1]
            type_element = retrieve_by_fhirpath(path.gsub('[x]', choice_type), resource, indexed)
            elements.merge!(type_element) unless blank?(type_element)
          end
          if normalized
            choice_type_elements = {}
            elements.each do |element_path, element|
              renorm = element_path.rpartition('.').first
              normalized_path = "#{renorm}.#{element_definition.path.split('.').last}"
              choice_type_elements[normalized_path] ||= []
              choice_type_elements[normalized_path].push(element).compact!
            end
            elements = choice_type_elements
          end
        else
          elements = retrieve_by_fhirpath(path, resource, indexed)
        end

        # Handle Slices
        if element_definition.sliceName
          # TODO: Need to be able to get other types of slices
          # Grab Extension slices
          return {} unless element_definition.type.first.code == 'Extension'

          # Only select the elements which match the slice profile.
          if indexed
            # Elements are already indexed
            elements.select! do |_k, element|
              element.url == element_definition.type.first.profile.first
            end
          else
            sliced_elements = {}
            elements.each do |element_path, element|
              sliced_elements[element_path] = element.select do |extension|
                extension.url == element_definition.type.first.profile.first
              end
            end
            elements = sliced_elements
          end
        end
        elements
      end

      def self.blank?(obj)
        obj.respond_to?(:empty?) ? obj.empty? : obj.nil?
      end

      private_class_method :blank?, :path_parts, :retrieve_from_structure, :indexed_elements_by_fhirpath
    end
  end
end
