require 'brock/field'

module Brock
  class StringField < Field

    def parse_param(value)
      value.to_s
    end

  end
end
