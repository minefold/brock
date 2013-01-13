require 'rspec'
require 'fakefs/safe'
require 'fakefs/spec_helpers'
require 'json'

def write_funpackfile(settings={})
  File.open("funpack.json", "w") do |file|
    file.puts(JSON.dump(settings))
  end
  File.expand_path("funpack.json")
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include FakeFS::SpecHelpers, :fakefs
  config.mock_with :rr
  config.order = 'random'
end
