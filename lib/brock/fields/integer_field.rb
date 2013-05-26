require 'brock/field'

module Brock
  module Fields
    class IntegerField < Field

      def load(val)
        Integer(val)
      rescue ArgumentError
        default
      end

      def default
        0
      end

    end
  end
end
