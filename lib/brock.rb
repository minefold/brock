require 'brock/definition'
require 'brock/version'

module Brock

  def self.version
    VERSION
  end

  def self.to_html(definition, values, options={})
    Definition.new(definition).to_html(values)
  end

  def self.parse_params(defintion, params)
    Definition.new(defintion).parse_paras(params)
  end

end
