require 'spec_helper'
require 'brock/fields/integer_field'

describe Brock::Fields::IntegerField do
  subject { described_class.new(:espresso) }

  describe "#load" do

    it "returns an integer" do
      expect(subject.load("123")).to eq(123)
    end

    it "returns the default if input is invalid" do
      expect(subject.load("invalid")).to eq(0)
    end

  end

  describe "#default" do

    it "defaults to 0" do
      expect(subject.default).to eq(0)
    end

  end

end
