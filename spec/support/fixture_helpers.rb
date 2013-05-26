module FixtureHelpers

  def fixture(filename)
    File.read(File.join(File.expand_path('../../fixtures', __FILE__), filename))
  end

end
