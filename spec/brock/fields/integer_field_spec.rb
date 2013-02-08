require 'spec_helper'
require 'brock/fields/integer_field'

describe Brock::IntegerField do

  subject { described_class.new(:espresso, 'default' => 1337) }

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
end
