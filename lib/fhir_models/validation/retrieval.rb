module FHIR
  module Validation
    # Methods for retrieving elements from resources
    module Retrieval
      # Retrieves all the elements associated with the given path with the FHIRPath of the element
      #
      # @param path [String] the path
      # @param resource [FHIR::Model] the resource from which the elements will be retrieved
      # @return [Hash] The desired elements
      def retrieve_element_with_fhirpath(path, resource, indexed = true)
        spath = path.split('.')
        base = spath.shift
        fhirpath_elements = { base => resource }
        last = spath.pop unless indexed

        desired_elements = spath.inject(fhirpath_elements) do |memo, meth|
          digging = {}
          memo.each do |k, v|
            fix_name = %w[class method resourceType].include?(meth) ? "local_#{meth}" : meth
            elms = v.send(fix_name) if v.is_a? FHIR::Model # FHIR Primitives are not modeled and will throw NoMethod Error
            # More than one element where the FHIRPath needs indexing
            if elms.respond_to? :each_with_index
              elms.each_with_index do |vv, kk|
                digging["#{k}.#{meth}[#{kk}]"] = vv unless blank?(vv)
              end
              # Just One
            else
              digging["#{k}.#{meth}"] = elms unless blank?(elms)
            end
          end
          digging
        end

        return desired_elements unless last

        # If we don't want to index the last element (useful for testing cardinality)
        not_indexed = {}
        desired_elements.each do |k, v|
          fix_name = %w[class method resourceType].include?(last) ? "local_#{last}" : last
          elms = v.send(fix_name) if v.is_a? FHIR::Model # FHIR Primitives are not modeled and will throw NoMethod Error
          not_indexed["#{k}.#{last}"] = elms
        end
        not_indexed
      end

      def retrieve_by_element_definition(resource, element_definition, indexed: false, normalized: false)
        # Check if we were provided a path that includes extensions (like in the ElementDefinition id versus the path)
        path = element_definition.path

        # Check for multiple choice types
        if element_definition.choice_type?
          elements = {}
          element_definition.type.each do |type|
            choice_type = type.code[0].upcase + type.code[1..-1]
            type_element = retrieve_element_with_fhirpath(path.gsub('[x]', choice_type), resource, indexed)
            elements.merge!(type_element) unless blank?(type_element)
          end
          if normalized
            choice_type_elements = {}
            elements.each do |k, v|
              renorm = k.rpartition('.').first
              normalized_path = "#{renorm}.#{element_definition.path.split('.').last}"
              choice_type_elements[normalized_path] ||= []
              choice_type_elements[normalized_path].push(v).compact!
            end
            elements = choice_type_elements
          end
        else
          elements = retrieve_element_with_fhirpath(path, resource, indexed)
        end

        # Handle Slices
        if element_definition.sliceName
          # TODO: Need to be able to get other types of slices
          # Grab Extension slices
          return {} unless element_definition.type.first.code == 'Extension'

          # Only select the elements which match the slice profile.
          if indexed
            # Elements are already indexed
            elements.select! do |_k, v|
              v.url == element_definition.type.first.profile.first
            end
          else
            sliced_elements = {}
            elements.each do |k, v|
              sliced_elements[k] = v.select do |ext|
                ext.url == element_definition.type.first.profile.first
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

      private_class_method :blank?
      module_function :retrieve_by_element_definition, :retrieve_element_with_fhirpath
    end
  end
end
