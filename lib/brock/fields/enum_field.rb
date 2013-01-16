require 'brock/fields/integer_field'

module Brock
  class EnumField < IntegerField

    def self.type
      :enum
    end

    def self.detect(params)
       (params['type'] == 'integer' and params['values']) or super(params)
    end

    def values
      @params['values']
    end

  end
end
