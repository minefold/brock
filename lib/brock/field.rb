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

    def self.new_from_params(params)
      new(params.fetch('name'), params)
    end

    def initialize(name, params = {})
      @name, @params = name.to_sym, params
    end

    def to_html(value=nil)
      FieldTemplate.new(self).render(value)
    end

    def parse_param(value)
      raise ParamParseError.new(value)
    end

    def label
      @params['label'] or
      name.to_s.gsub(/[^[:alnum:]]+/,' ').sub(/^(.)/) {|l| l.upcase }
    end

    def default
      @params['default']
    end

    def description
      @params['description']
    end

  end
end
