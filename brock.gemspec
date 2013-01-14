# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brock/version'

Gem::Specification.new do |gem|
  gem.name          = 'brock'
  gem.version       = Brock::VERSION
  gem.authors       = ["Dave Newman"]
  gem.email         = ["dave@minefold.com"]
  gem.description   = %q{Test Minefold funpacks}
  gem.summary       = %q{Test Minefold funpacks}
  gem.homepage      = "https://minefold.com"

  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'fakefs'

  gem.files = %w(
    Gemfile
    LICENSE.txt
    README.md
    Rakefile
    brock.gemspec
  ) + Dir["lib/**/*"]
end
