require 'spec_helper'
require 'brock/fields/string_field'

describe Brock::StringField do

  subject {
    described_class.new(
      'type' => 'string',
      'name' => 'first_name',
      'label' => 'First name'
    )
  }

  it_behaves_like "a field"

  describe "#parse_param" do

    it "works with string" do
      expect(subject.parse_param('foo')).to eq('foo')
    end

    it "calls to_s on other objects" do
      obj = stub(to_s: 'sentinal')
      expect(subject.parse_param(obj)).to eq('sentinal')
    end

  end

  it "#default is optional" do
    expect(subject.default).to eq(nil)
  end

end
