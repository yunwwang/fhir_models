module FHIR
  # Validator which allows validation of a resource against a profile
  class ProfileValidator
    @vs_validators = {}
    attr_accessor :all_results
    attr_accessor :show_skipped

    # Create a ProfileValidator from a FHIR::StructureDefinition
    #
    # @param profile [FHIR::StructureDefinition]
    #
    def initialize(profile)
      @profile = profile
      @all_results = []
      @show_skipped = true
    end

    def validate(resource)
      validate_against_hierarchy(resource)
      @all_results
    end

    # Build a hierarchy from a list of ElementDefinitions
    #
    # @param [Array] List of Element Definitions
    # @return [Hash] The ElementDefinition hierarchy
    private def build_hierarchy(elem_def_list)
      hierarchy = {}
      elem_def_list.each do |element|
        # Separate path and slices into an array of keys
        slices = element.id.split(':')
        path = slices.shift.split('.')
        slices = slices.pop&.split('/')
        last_path = slices.nil? ? path.pop : slices.pop

        # Build the hierarchy
        thing = path.inject(hierarchy) do |memo, k|
          memo[k] ||= { elementDefinition: nil, path: {}, slices: {} }
          memo[k][:path]
        end

        # If there are slices
        unless slices.nil?
          path_down = path.zip(Array.new(path.length - 1, :path)).push(:slices).flatten.compact
          thing = slices.inject(hierarchy.dig(*path_down)) do |memo, k|
            memo[k] ||= { elementDefinition: nil, path: {}, slices: {} }
            memo[k][:slices]
          end
        end

        # If there are no slices
        thing[last_path] = { elementDefinition: element, path: {}, slices: {} }
      end
      hierarchy
      # traverse(hierarchy) { |x| puts x.id }
    end

    # Traverse the hierarchy
    #
    # @param hierarchy [Hash] element definition hierarchy
    # @yield [elementDefinition] provides the element definition to the block
    private def traverse(hierarchy, &block)
      hierarchy.each do |_, v|
        # yield that element definition
        yield(v[:elementDefinition])
        traverse(v[:slices], &block) unless v[:slices].empty?
        traverse(v[:path], &block) unless v[:path].empty?
      end
    end

    private def validate_against_hierarchy(resource)
      @snapshot_hierarchy ||= build_hierarchy(@profile.snapshot.element)
      # Slicing is prohibited on first element so we only check the paths
      # http://www.hl7.org/fhir/elementdefinition.html#interpretation
      @snapshot_hierarchy.values.each do |value|
        validate_hierarchy(resource, value)
      end
      @snapshot_hierarchy
    end

    private def validate_hierarchy(resource, hierarchy, skip = false)
      # Validate the element
      hierarchy[:results] ||= []
      element_definition = hierarchy[:elementDefinition]

      elements = retrieve_by_element_definition(element_definition, resource, false)
      result = []

      if skip && @show_skipped
        result.push(*verify_element(nil, element_definition, p, skip))
        hierarchy[:results].push(*result)
        @all_results.push(*result)
        return
      end

      # Normalize type choice elements to just the element for cardinality testing
      if element_definition.path.end_with? '[x]'
        mtelms = Hash.new([])
        elements.each do |k, v|
          renorm = k.rpartition('.').first
          mtelms["#{renorm}.#{element_definition.path.split('.').last}"].push(v)
        end
        elements = mtelms
      end

      # Validate the Element
      elements.each do |p, el|
        result.push(*verify_element(el, element_definition, p, skip))
      end

      # Save the validation results
      hierarchy[:results].push(*result)
      @all_results.push(*result)

      # Check to see if there are any valid elements to determine if we need to check the subelements
      element_exists = !blank?(elements.values.flatten.compact)

      # If the element doesn't exist we don't need to check its subelements unless we are instructed to by showskipped
      return unless @show_skipped || element_exists

      # Validate the subpath elements
      hierarchy[:path].values.each { |v| validate_hierarchy(resource, v, !element_exists) }

      # Validate the slices elements
      hierarchy[:slices].values.each { |v| validate_hierarchy(resource, v, !element_exists) }
    end

    private def blank?(obj)
      obj.respond_to?(:empty?) ? obj.empty? : obj.nil?
    end

    # Verify the element in the provided resource based on the provided ElementDefinition
    #
    # @param resource [FHIR::Model] The resource to be validated
    # @param element_definition [FHIR::ElementDefinition] The ElementDefintion Resource which provides the validation criteria
    private def verify_element(element, element_definition, current_path, skip = false)
      # This will hold the FHIR::ValidationResults from the various checks
      results = []
      results.push(ElementValidator.verify_element_cardinality(element, element_definition, current_path, skip))
      results
    end

    # Splits a path into an array
    private def element_path_array(element_definition)
      element_definition.path.split('.')
    end

    # Retrieves all the elements associated with the path
    # i.e. Patient.contact.name will return an array with all the names.
    #
    # @param path [String] the path
    # @param resource [FHIR::Model] the resource from which the elements will be retrieved
    # @return [Array] The desired elements
    private def retrieve_element(path, resource)
      path.split('.').drop(1).inject(resource) do |memo, meth|
        [memo].flatten.map { |thing| thing.send(meth) }
      end
    end

    # Retrieves all the elements associated with the given path with the FHIRPath of the element
    #
    #
    # @param path [String] the path
    # @param resource [FHIR::Model] the resource from which the elements will be retrieved
    # @return [Hash] The desired elements
    private def retrieve_element_with_fhirpath(path, resource, indexed = true)
      spath = path.split('.')
      base = spath.shift
      fhirpath_elements = { base => resource }
      last = spath.pop unless indexed

      desired_elements = spath.inject(fhirpath_elements) do |memo, meth|
        digging = {}
        memo.each do |k, v|
          elms = v.send(meth)
          # More than one element where the FHIRPath needs indexing
          if elms.respond_to? :each_with_index
            elms.each_with_index do |vv,kk|
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
        elms = v.send(last)
        not_indexed["#{k}.#{last}"] = elms
      end
      not_indexed
    end

    private def retrieve_by_element_definition(elementdefinition, resource, indexed = true)
      # Check if we were provided a path that includes extensions (like in the ElementDefinition id versus the path)
      path = elementdefinition.path

      # Check for multiple choice types
      if path.include? '[x]'
        elements = {}
        elementdefinition.type.each do |type|
          choice_type = type.code[0].upcase + type.code[1..-1]
          type_element = retrieve_element_with_fhirpath(path.gsub('[x]', choice_type), resource, indexed)
          elements.merge!(type_element) unless blank?(type_element)
        end
      else
        elements = retrieve_element_with_fhirpath(path, resource, indexed)
      end

      # Handle Slices
      if elementdefinition.sliceName
        # Grab Extension slices
        if elementdefinition.type.one?
          if elementdefinition.type.first.code == 'Extension'
            # Only select the elements which match the slice profile.
            elements.select! do |k,v|
              if indexed
                v.url == elementdefinition.type.first.profile.first
              else
                v.select! {|vv| vv.url == elementdefinition.type.first.profile.first}
              end
            end
          else
            raise UnhandledSlice("Slice type #{elementdefinition.type.code} is not handled. Only Extension slices are handled")
          end
        else
          raise UnhandledSlice("Slice has more than one type. #{elementdefinition.id}")
        end
      end
      elements
    end

    # Method for registering ValueSet and CodeSystem Validators
    #
    # @param valueset_uri [String] The ValueSet URI the validator is related to
    # @param validator [#validate] The validator
    def register_vs_validator(valueset_uri, validator)
      @vs_validators[valueset_uri] = validator
    end

    # This Exception is for indicating types of slices that are not handled.
    #
    class UnhandledSlice < StandardError
      def initialize(msg="Unhandled Slice")
        super(msg)
      end
    end
  end
end
