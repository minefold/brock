require 'spec_helper'
require 'brock/fields/boolean_field'

describe Brock::BooleanField do

  subject { described_class.new(:espresso) }

  it_behaves_like "a field"

  it "asdf" do

    expect(subject.to_html(true)).to match(/checked/)

  end

  describe ".detect" do

    it "picks fields with type boolean" do
      expect(described_class.detect('type' => 'boolean'))
    end

    it "picks fields with boolean defaults" do
      expect(described_class.detect('default' => true))
    end

  end

  describe "#parse_param" do

    it "works with on" do
      expect(subject.parse_param('on')).to eq(true)
    end

    it "works with 1" do
      expect(subject.parse_param('1')).to eq(true)
    end

    it "works with true" do
      expect(subject.parse_param('true')).to eq(true)
    end

    it "works with truthy-objects" do
      expect(subject.parse_param(true)).to eq(true)
    end

  end

  describe "#default" do

    it "can be set in the constructor" do
      subject = described_class.new(:latte, 'default' => false)
      expect(subject.default).to be_false
    end

    it "defaults to true" do
      expect(subject.default)
    end

  end

end
