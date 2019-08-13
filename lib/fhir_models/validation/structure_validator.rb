module FHIR
  module Validation
    # Validator which allows validation of a resource against a profile
    class StructureValidator
      @vs_validators = {}

      attr_accessor :all_results
      attr_accessor :show_skipped
      attr_reader :element_validators

      # Create a StructureValidator from a FHIR::StructureDefinition
      #
      # @param profile [FHIR::StructureDefinition]
      #
      def initialize(profile, use_default_element_validators: true)
        @profile = profile
        @show_skipped = true
        @element_validators = Set.new
        add_default_element_validators if use_default_element_validators
      end

      # Validate the provided resource
      #
      # @param resource [FHIR::Model] The Resource to be validated
      # @return [Hash] the validation results
      def validate(resource)
        return [FHIR::ValidationResult.new(validation_type: :structure, result: :fail)] unless resource.is_a? FHIR::Model

        validate_against_snapshot(resource)

        FHIR::Validation::StructureValidationResult.new(@snapshot_hierarchy).all_results
      end

      # Removes the currently registered element validators
      def clear_element_validators
        @element_validators = Set.new
      end

      # Add additional element validators
      # @param element_validator [Enumerable<#validate>]
      def register_element_validators(element_validator)
        @element_validators.add(*element_validator)
      end

      # Add the default Element Validators to the StructureValidator
      def add_default_element_validators
        @element_validators.merge(Set[Validation::CardinalityValidator,
                                      Validation::DataTypeValidator,
                                      Validation::FixedValueValidator,
                                      Validation::MaxLengthValidator])
      end

      # Build a hierarchy from a list of ElementDefinitions
      #
      # @param [Array] List of Element Definitions
      # @return [Hash] The ElementDefinition hierarchy
      private def build_hierarchy(element_definitions)
        hierarchy = {}
        element_definitions.each do |element|
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
      end

      private def validate_against_snapshot(resource)
        @snapshot_hierarchy ||= build_hierarchy(@profile.snapshot.element)
        # Slicing is prohibited on first element so we only check the paths
        # http://www.hl7.org/fhir/elementdefinition.html#interpretation
        @snapshot_hierarchy.values.each do |value|
          validate_hierarchy(resource, value)
        end
        @snapshot_hierarchy
      end

      private def validate_hierarchy(resource, hierarchy)
        # Validate the element
        hierarchy[:results] ||= []
        element_definition = hierarchy[:elementDefinition]

        # Get the Results
        results = @element_validators.flat_map { |validator| validator.validate(resource, element_definition) }
        results.compact!
        results.each { |res| res.profile ||= @profile.url }

        # Save the validation results
        hierarchy[:results].push(*results)

        # Check to see if there are any valid elements to determine if we need to check the subelements
        elements = resource.retrieve_elements_by_definition(element_definition)
        element_exists = !blank?(elements.values.flatten.compact)

        # If the element doesn't exist we don't need to check its subelements unless we are instructed to by showskipped
        return unless @show_skipped || element_exists

        # Validate the subpath elements
        hierarchy[:path].values.each { |v| validate_hierarchy(resource, v) }

        # Validate the slices elements
        hierarchy[:slices].values.each { |v| validate_hierarchy(resource, v) }
      end

      private def blank?(obj)
        obj.respond_to?(:empty?) ? obj.empty? : obj.nil?
      end

      # Splits a path into an array
      private def element_path_array(element_definition)
        element_definition.path.split('.')
      end
    end
  end
end
