module Brock
  class Field

    class MissingNameError < ArgumentError
    end

    attr_reader :name

    attr_reader :default
    attr_reader :description

    def self.build(field)
      name = field.delete('name') or raise MissingNameError
      new(name, field)
    end

    def self.format_label(name)
      name.gsub(/[^[:alnum:]]+/, ' ').sub(/^(.)/) {|l| l.upcase }
    end

    def initialize(name, params = {})
      @name, @params = name.to_s, params
      @label = @params['label']
      @default = @params['default']
      @description = @params['description']
    end

    def label
      @label or self.class.format_label(name)
    end

    # Loads in raw values stored on disk in string form
    def load(raw)
      raw
    end

    # Dumps a value out to format supported on disk
    def dump(val)
      (val || default).to_s
    end

  end
end
