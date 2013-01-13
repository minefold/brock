# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'funpack_settings/version'

Gem::Specification.new do |gem|
  gem.name          = "funpack-settings"
  gem.version       = FunpackSettings::VERSION
  gem.authors       = ["Dave Newman"]
  gem.email         = ["dave@minefold.com"]
  gem.description   = %q{Test Minefold funpacks}
  gem.summary       = %q{Test Minefold funpacks}
  gem.homepage      = "https://minefold.com"

  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.files = %w(
    Gemfile
    LICENSE.txt
    README.md
    Rakefile
    funpack-settings.gemspec
  ) + Dir["lib/**/*"]
end
