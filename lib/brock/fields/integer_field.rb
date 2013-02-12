require 'brock/field'

module Brock
  class IntegerField < Field

    def self.type
      :integer
    end

    def parse_param(value)
      if value == '' || value.nil?
        default
      else
        Integer(value)
      end
    rescue ArgumentError, TypeError
      super(value)
    end

  end
end
