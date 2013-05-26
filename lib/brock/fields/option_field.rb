require 'brock/field'

module Brock
  module Fields
    class OptionField < Field

      def dump(val)
        if options.any? {|option| option['value'] == val.to_s}
          val
        else
          default
        end.to_s
      end

      def options
        @params['options'] || []
      end

      def default
        super || options.first['value']
      end

    end
  end
end
