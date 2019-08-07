module FHIR
  module Validation
    # Represents the results of validating a structure.
    class StructureValidationResult
      attr_accessor :validation_hash

      def initialize(validation_hash)
        @validation_hash = validation_hash
      end

      def all_results
        all_validation_results(@validation_hash)
      end

      private def all_validation_results(hierarchy)
        hierarchy.flat_map do |_, v|
          slice_results = v[:slices].empty? ? [] : all_validation_results(v[:slices])
          sub_element_results = v[:path].empty? ? [] : all_validation_results(v[:path])
          v[:results].concat(slice_results, sub_element_results)
        end
      end
    end
  end
end
