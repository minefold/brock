require 'brock/fields'

module Brock

  class Schema

    attr_reader :fields

    def self.build_field(raw_field)
      case raw_field.delete('type')
      when 'boolean'
        Fields::BooleanField
      when 'integer'
        Fields::IntegerField
      when 'option'
        Fields::OptionField
      when 'text'
        Fields::TextField
      else
        Fields::StringField
      end.build(raw_field)
    end

    def self.build(data)
      new(data.map {|field| build_field(field) })
    end

    def initialize(fields)
      @fields = fields
    end

    def has_field?(name)
      @fields.any? {|field| field.name == name.to_s }
    end

  end
end
