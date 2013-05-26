require 'brock/field'

module Brock
  module Fields
    class BooleanField < Field

      def load(val)
        val == "true"
      end

      def default
        if @params.has_key?('default')
          @params['default']
        else
          true
        end
      end

    end
  end
end
