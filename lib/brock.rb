require 'brock/manifest'
require 'brock/version'

module Brock

  def self.version
    VERSION
  end

  def self.to_html(manifest, values, options={})
    Manifest.new(definition).to_html(values)
  end

  def self.parse_params(manifest, params)
    Manifest.new(defintion).parse_paras(params)
  end

end
