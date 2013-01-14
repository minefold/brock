module Brock
  class Definitions
    def initialize(defs)
      @defs = defs
    end

    def to_h(values = {})
      settings = {}
      @defs.each do |defn|
        type, name, default = defn['type'], defn['name'], defn['default']

        settings[name] = value(type, default, values[name])
      end

      settings
    end

    def value(type, default, value)
      case type
      when 'boolean'
        !value.nil?

      when 'integer'
        Integer(value) rescue default

      else
        value || default
      end
    end
  end
end
