require 'brock/fields/boolean_field'
require 'brock/fields/integer_field'
require 'brock/fields/select_field'
require 'brock/fields/string_field'
require 'brock/fields/text_field'

module Brock

  class FieldTypeNotSupported < StandardError
  end

  class Schema

    attr_reader :fields

    FIELD_TYPES = [
      IntegerField,
      BooleanField,
      TextField,
      SelectField,
      StringField
    ]

    def self.field_for(raw)
      klass = FIELD_TYPES.detect {|type| type.detect(raw) }
      if klass
        klass.new_from_params(raw)
      else
        raise FieldTypeNotSupported.new(raw)
      end
    end

    def initialize(raw_fields)
      @fields = raw_fields.map {|raw_field| self.class.field_for(raw_field) }
    end

    def to_html(values = {})
      fields.map do |field|
        field.to_html(values[field.name.to_s])
      end.join("\n")
    end

    def parse_params(params)
      fields.each_with_object({}) do |field, settings|
        settings[field.name] = field.parse_param(params[field.name])
      end
    end

  # private

    def field_with_name(name)
      fields.find {|field| field.name == name.to_sym }
    end

  end
end
