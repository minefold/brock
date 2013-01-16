require 'brock/field'

module Brock
  class BooleanField < Field

    def type
      :boolean
    end

    def default
      if @default.nil?
        true
      else
        @default
      end
    end

    def parse_param(value)
      value == '1' || value == 'true' || value == true
    end

  end
end
