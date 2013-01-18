require 'spec_helper'
require 'brock/fields/text_field'

describe Brock::TextField do

  subject {
    described_class.new(:whitelist)
  }

  it_behaves_like "a field"

  describe "#parse_param" do

    it "works with string" do
      expect(subject.parse_param('foo')).to eq('foo')
    end

  end

  it "#default is optional" do
    expect(subject.default).to eq(nil)
  end

end
