require 'brock/field'

module Brock
  class IntegerField < Field

    def parse_param(value)
      Integer(value)
    rescue ArgumentError
      raise ParamParseError.new(value)
    end

  end
end
