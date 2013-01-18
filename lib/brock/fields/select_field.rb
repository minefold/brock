require 'brock/field'

module Brock
  class SelectField < Field

    def self.type
      :select
    end

    def self.detect(field)
      super(field) or (
        field['values'] and
        (field['type'] == 'string' or not field.has_key?('type'))
      )
    end

    def parse_param(value)
      value.to_s
    end

    def values
      @params['values'] || []
    end

  end
end
