require 'brock/field'

module Brock
  class BooleanField < Field

    def self.type
      :boolean
    end

    def default
      if @params.has_key?('default')
        @params['default']
      else
        true
      end
    end

    def parse_param(value)
      value == '1' || value == 'true' || value == true
    end

  end
end
