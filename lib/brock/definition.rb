require 'brock/fields/boolean_field'
require 'brock/fields/integer_field'
require 'brock/fields/string_field'

module Brock

  class FieldTypeNotSupported < StandardError
  end

  class Definition

    attr_reader :fields

    def self.field_for_type(type)
      case type
      when 'boolean'
        BooleanField
      when 'integer'
        IntegerField
      when 'string'
        StringField
      else
        raise FieldTypeNotSupported
      end
    end

    def initialize(definitions)
      @fields = definitions.map do |definition|
        klass = self.class.field_for_type(definition.fetch('type'))
        klass.new(definition)
      end
    end

    def to_html(values)
      fields.map do |field|
        field.to_html(values.fetch(field.name))
      end.join("\n")
    end

    def parse_params(params)
      params.each_with_object({}) do |(name, value), settings|
        field = field_with_name(name)
        settings[field.name] = field.parse_param(value)
      end
    end

  # private

    def field_with_name(name)
      fields.find {|field| field.name == name.to_sym }
    end

  end
end
