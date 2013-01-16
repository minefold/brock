require 'brock/fields/boolean_field'
require 'brock/fields/integer_field'
require 'brock/fields/string_field'

module Brock

  class FieldTypeNotSupported < StandardError
  end

  class Schema

    attr_reader :fields

    FIELD_TYPES = [
      IntegerField,
      BooleanField,
      StringField
    ]

    def self.field_for(raw)
      FIELD_TYPES.find {|type| type.detect(raw) }.new(raw)
    end

    def initialize(raw_fields)
      @fields = raw_fields.map {|raw_field| field_for(raw_field) }
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
