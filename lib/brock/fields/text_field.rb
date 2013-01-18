require 'brock/field'

module Brock
  class TextField < Field

    def self.type
      :text
    end

    def parse_param(value)
      value.to_s
    end

  end
end
