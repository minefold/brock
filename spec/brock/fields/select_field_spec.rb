require 'spec_helper'
require 'brock/fields/select_field'

describe Brock::SelectField do

  subject {
    described_class.new(:espresso, 'values' => [
      {'value' => 0, 'label' => 'First', 'description' => 'The first'},
      {'value' => 1, 'label' => 'Second', 'description' => 'The second'}
    ])
  }

  it_behaves_like "a field"

  describe ".detect" do

    it "is true for fields without a type and just a value" do
      expect(described_class.detect("type" => "string", "values" => []))
    end

    it "is true for fields without a type and just a value" do
      expect(described_class.detect("values" => []))
    end

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

  it "#default is optional" do
    expect(subject.default).to eq(nil)
  end

end
