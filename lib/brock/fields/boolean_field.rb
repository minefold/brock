require 'brock/field'

module Brock
  class BooleanField < Field

    def parse_param(value)
      value == '1' || value == 'true' || value == true
    end

  end
end
