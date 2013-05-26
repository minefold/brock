require 'spec_helper'
require 'brock/fields/option_field'

describe Brock::Fields::OptionField do
  subject {
    described_class.new(:espresso, 'options' => [
      {'value' => 'First', 'label' => 'First', 'description' => 'A first'},
      {'value' => 'Second', 'label' => 'Second', 'description' => 'A second'}
    ])
  }

  describe "#dump" do

    it "ignores bad values" do
      expect(subject.dump('Third')).to eq('First')
    end

  end

  describe "#default" do

    it "defaults to the first option" do
      expect(subject.default).to eq('First')
    end

  end

end
