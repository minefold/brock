require 'brock/field'

module Brock
  class StringField < Field

    def self.type
      :string
    end

    def self.detect(field)
      super(field) or not field.has_key?('type')
    end

    def parse_param(value)
      value.to_s
    end

  end
end
