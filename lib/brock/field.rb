require 'brock/field_template'

module Brock
  class ParamParseError < ArgumentError
  end

  class Field

    attr_reader :type
    attr_reader :name
    attr_reader :label
    attr_reader :default

    attr_reader :description

    def self.detect(params)
      params['type'] == type.to_s
    end

    def initialize(params = {})
      @name = params.fetch('name').to_sym

      @label = params['label']
      @default = params['default']
      @description = params['description']
    end

    def to_html(value=nil)
      FieldTemplate.new(self).render(value)
    end

    def parse_param(value)
      raise ParamParseError.new(value)
    end

    def label
      @label || name.gsub(/[^[:alnum:]]+/,' ').sub(/^(.)/) {|l| l.upcase }
    end

  end
end
