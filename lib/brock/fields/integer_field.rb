require 'brock/field'

module Brock
  class IntegerField < Field

    def self.type
      :integer
    end

    def parse_param(value)
      Integer(value)
    rescue ArgumentError, TypeError
      super(value)
    end

  end
end
