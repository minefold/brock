require 'brock/field'

module Brock
  module Fields
    class StringField < Field

      def default
        super || String.new
      end

    end
  end
end
