module FixtureHelpers

  def scrub_html(str)
    str.gsub(/\s+/, ' ')
  end

  def fixture(filename)
    File.read(File.join(File.expand_path('../../fixtures', __FILE__), filename))
  end

end
