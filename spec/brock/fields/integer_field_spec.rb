require 'spec_helper'
require 'brock/fields/integer_field'

describe Brock::IntegerField do

  subject {
    described_class.new(
      'type' => 'integer',
      'name' => 'rounds',
      'label' => 'Rounds',
      'default' => 10
    )
  }

  it "has :integer type" do
    expect(subject.type).to eq(:integer)
  end

  it "#to_html works" do
    expect(subject.to_html(5)).to be_similar_to_fixture('integer_field.html')
  end

  describe "#parse_param" do

    it "works with an integer" do
      expect(subject.parse_param(10)).to eq(10)
    end

    it "works with an integer-like string" do
      expect(subject.parse_param('10')).to eq(10)
    end

    it "raises with anything else" do
      expect {
        subject.parse_param('boom')
      }.to raise_error(Brock::ParamParseError)
    end

  end
end
