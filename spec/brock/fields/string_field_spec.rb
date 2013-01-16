require 'spec_helper'
require 'brock/fields/string_field'

describe Brock::StringField do

  subject {
    described_class.new(
      'type' => 'string',
      'name' => 'first_name',
      'label' => 'First name',
      'default' => 'Chris'
    )
  }

  it "has :string type" do
    expect(subject.type).to eq(:string)
  end

  it "#to_html works" do
    expect(subject.to_html(5)).to be_similar_to_fixture('string_field.html')
  end

  describe "#parse_param" do

    it "works with string" do
      expect(subject.parse_param('foo')).to eq('foo')
    end

    it "calls to_s on other objects" do
      obj = stub(to_s: 'sentinal')
      expect(subject.parse_param(obj)).to eq('sentinal')
    end

  end
end
