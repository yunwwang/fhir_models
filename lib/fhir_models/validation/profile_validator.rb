module FHIR
  # Validator which allows validation of a resource against a profile
  class ProfileValidator
    @vs_validators = {}

    attr_accessor :all_results
    attr_accessor :show_skipped
    attr_accessor :element_validators

    # Create a ProfileValidator from a FHIR::StructureDefinition
    #
    # @param profile [FHIR::StructureDefinition]
    #
    def initialize(profile)
      @profile = profile
      @all_results = []
      @show_skipped = true
      @element_validators = []
    end

    # Validate the provided resource
    #
    # @param resource [FHIR::Model] The Resource to be validated
    # @return [Hash] the validation results
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

      # Get the Results
      results = @element_validators.flat_map { |validator| validator.validate(resource, element_definition)}
      results.compact!
      results.each { |res| res.profile ||= @profile.url }

      # Save the validation results
      hierarchy[:results].push(*results)
      @all_results.push(*results)

      # Check to see if there are any valid elements to determine if we need to check the subelements
      elements = FHIR::Validation::Retrieval.retrieve_by_element_definition(resource,
                                                                            element_definition)
      element_exists = !blank?(elements.values.flatten.compact)

      # If the element doesn't exist we don't need to check its subelements unless we are instructed to by showskipped
      return unless @show_skipped || element_exists

      # Validate the subpath elements
      hierarchy[:path].values.each { |v| validate_hierarchy(resource, v, !element_exists) }

      # Validate the slices elements
      hierarchy[:slices].values.each { |v| validate_hierarchy(resource, v, !element_exists) }
    end

    def register_element_validator(element_validator)
      @element_validators.push(element_validator)
    end

    private def blank?(obj)
      obj.respond_to?(:empty?) ? obj.empty? : obj.nil?
    end

    # Splits a path into an array
    private def element_path_array(element_definition)
      element_definition.path.split('.')
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
      def initialize(msg = 'Unhandled Slice')
        super(msg)
      end
    end
  end
end
