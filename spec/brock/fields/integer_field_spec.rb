require 'spec_helper'
require 'brock/fields/integer_field'

describe Brock::IntegerField do

  subject {
    described_class.new(
      'type' => 'integer',
      'name' => 'rounds',
      'label' => 'Rounds'
    )
  }

  it_behaves_like "a field"

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

  it "#default is optional" do
    expect(subject.default).to eq(nil)
  end

end
