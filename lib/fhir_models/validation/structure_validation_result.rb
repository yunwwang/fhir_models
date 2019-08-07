#require_relative 'traverse'
module FHIR
  module Validation
    class StructureValidationResult

      def initialize(validation_hash)
        @validation_hash = validation_hash
      end

      def traverse_results(&block)
        traverse(@validation_hash, :results, &block)
      end

      def traverse_element_definition(&block)
        traverse(@validation_hash, :element_definition, &block)
      end

      def all_results
        all_validation_results(@validation_hash)
      end

      def results_for_path(path)
        slices = path.split(':')
        path = slices.shift.splt('.')
        hierarchy = @validation_hash[path.shift.to_sym]
        path.inject(hierarchy) do |memo, k|
          memo[:path][k.to_sym]
        end[:results]
      end

      private def traverse(hierarchy, desired_key, &block)
        hierarchy.each do |_, v|
          # yield the desired value
          yield(v[:desired_key])
          traverse(v[:slices], desired_key, &block) unless v[:slices].empty?
          traverse(v[:path], desired_key, &block) unless v[:path].empty?
        end
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