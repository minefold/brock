require 'spec_helper'
require 'brock/fields/boolean_field'

describe Brock::Fields::BooleanField do
  subject { described_class.new(:espresso) }

  describe "#load" do

    it "returns a boolean" do
      expect(subject.load('true')).to be_a(TrueClass)
    end

    it "works" do
      expect(subject.load('false')).to be_false
    end

  end

  describe "#default" do

    it "defaults to true" do
      expect(subject.default)
    end

  end

end
