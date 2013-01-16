require 'brock/fields/boolean_field'
require 'brock/fields/integer_field'
require 'brock/fields/string_field'

module Brock

  class FieldTypeNotSupported < StandardError
  end

  class Schema

    attr_reader :fields

    def self.field_for_type(type)
      case type
      when 'boolean'
        BooleanField
      when 'integer'
        IntegerField
      when 'string', nil
        StringField
      else
        raise FieldTypeNotSupported
      end
    end

    def initialize(raw_fields)
      @fields = raw_fields.map do |raw_field|
        klass = self.class.field_for_type(raw_field['type'])
        klass.new(raw_field)
      end
    end

    def to_html(values = {})
      fields.map do |field|
        field.to_html(values[field.name])
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