require 'nokogiri'
require 'mime/types'
require 'yaml'
require 'bcp47'

module FHIR
  class Model
    extend FHIR::Deprecate
    def initialize(hash = {})
      from_hash(hash)
      self.class::METADATA.each do |key, value|
        local_name = key
        local_name = value['local_name'] if value['local_name']
        if value['max'] > 1 && instance_variable_get("@#{local_name}").nil?
          instance_variable_set("@#{local_name}".to_sym, [])
        end
      end
    end

    # This is necessary for uniq to properly identify two FHIR models as being identical
    def hash
      to_hash.hash
    end

    # allow two FHIR models to be compared for equality
    def ==(other)
      self.class == other.class && to_hash == other.to_hash
    end
    alias eql? ==

    def method_missing(method, *_args, &_block)
      if defined?(self.class::MULTIPLE_TYPES) && self.class::MULTIPLE_TYPES[method.to_s]
        self.class::MULTIPLE_TYPES[method.to_s].each do |type|
          type[0] = type[0].upcase
          value = send("#{method}#{type}".to_sym)
          return value unless value.nil?
        end
        return nil
      elsif !@extension.nil? && !@extension.empty?
        ext = @extension.select do |x|
          name = x.url.tr('-', '_').split('/').last
          anchor = name.split('#').last
          (method.to_s == name || method.to_s == anchor)
        end
        unless ext.first.nil?
          return ext.first.value.nil? ? ext.first : ext.first.value
        end
      elsif !@modifierExtension.nil? && !@modifierExtension.empty?
        ext = @modifierExtension.select do |x|
          name = x.url.tr('-', '_').split('/').last
          anchor = name.split('#').last
          (method.to_s == name || method.to_s == anchor)
        end
        unless ext.first.nil?
          return ext.first.value.nil? ? ext.first : ext.first.value
        end
      end
      raise NoMethodError.new("undefined method `#{method}' for #{inspect}", method)
    end

    def to_reference
      FHIR::Reference.new(reference: "#{self.class.name.split('::').last}/#{id}")
    end

    def equals?(other, exclude = [])
      (self.class::METADATA.keys - exclude).each do |attribute|
        return false unless compare_attribute(instance_variable_get("@#{attribute}".to_sym), other.instance_variable_get("@#{attribute}".to_sym), exclude)
      end
      true
    end

    def mismatch(other, exclude = [])
      misses = []
      (self.class::METADATA.keys - exclude).each do |key|
        these = attribute_mismatch(instance_variable_get("@#{key}".to_sym), other.instance_variable_get("@#{key}".to_sym), exclude)
        if !these || (these.is_a?(Array) && !these.empty?)
          misses << "#{self.class}::#{key}"
          misses.concat these if these.is_a?(Array)
        end
      end
      misses
    end

    def attribute_mismatch(left, right, exclude = [])
      if left.respond_to?(:mismatch) && right.respond_to?(:mismatch)
        left.mismatch right, exclude
      else
        compare_attribute(left, right, exclude)
      end
    end

    def compare_attribute(left, right, exclude = [])
      if left.respond_to?(:equals?) && right.respond_to?(:equals?)
        left.equals? right, exclude
      elsif left.is_a?(Array) && right.is_a?(Array) && (left.length == right.length)
        result = true
        (0...(left.length)).each { |i| result &&= compare_attribute(left[i], right[i], exclude) }
        result
      else
        left == right
      end
    end

    def valid?
      validate.select { |res| res.result == :fail }.empty?
    end
    deprecate :is_valid?, :valid?

    def validate
      type_name = self.class.name.split('::').last
      type_def = FHIR::Definitions.type_definition(type_name) || FHIR::Definitions.resource_definition(type_name)
      FHIR::Validation::StructureValidator.new(type_def).validate(self)
    end

    def primitive?(datatype, value)
      FHIR.logger.warn("prefer using FHIR.primitive? Called from #{caller.first}")
      FHIR.primitive?(datatype: datatype, value: value)
    end
    deprecate :is_primitive?, :primitive?
  end
end
