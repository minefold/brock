require 'brock/schema'
require 'brock/version'

module Brock

  def self.version
    VERSION
  end

  def self.to_html(schema, values, options={})
    Schema.new(schema).to_html(values)
  end

  def self.parse_params(schema, params)
    Schema.new(schema).parse_paras(params)
  end

end
