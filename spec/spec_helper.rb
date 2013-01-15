module FixtureHelpers

  def fixture(path)
    File.read(File.join(File.dirname(__FILE__), 'fixtures', path))
  end

end

RSpec::Matchers.define :be_similar_to_fixture do |fixture_path|

  def scrub(str)
    str.gsub(/\s+/, ' ')
  end

  match do |actual|
    scrub(actual) == scrub(fixture(fixture_path))
  end

end

RSpec.configure do |config|
  config.include(FixtureHelpers)
  config.order = 'random'
end
