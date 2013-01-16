Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.include(FixtureHelpers)
  config.order = 'random'
end
