require 'spec_helper'
require 'brock/field'

# def label
#   @params['label'] or self.class.format_label(name)
# end
#
# def default
#   @params['default']
# end
#
# def description
#   @params['description']
# end
#
# # Loads in raw values stored on disk in string form
# def load(raw)
#   raw
# end
#
# # Dumps a value out to format supported on disk
# def dump(val)
#   (val || default).to_s
# end



describe Brock::Field do
  subject { described_class.new('mp-maxrounds') }

  describe ".build" do

    it "raises an error if it's missing a name" do
      expect {
        described_class.build({})
      }.to raise_error(Brock::Field::MissingNameError)
    end

    it "creates a new field" do
      expect(described_class.build('name' => 'mode')).to be_a(Brock::Field)
    end

  end

  describe "#label" do

    it "uppercases the label by default" do
      expect(subject.label).to eq('Mp maxrounds')
    end

    it "returns the default if provided" do
      subject = described_class.new('mp-maxrounds', 'label' => 'MP Maxrounds')
      expect(subject.label).to eq('MP Maxrounds')
    end

  end

  describe "#dump" do

    it "returns the string value of the arg" do
      expect(subject.dump(1)).to eq('1')
    end

    it "returns the default if the value is not present" do
      subject = described_class.new(:mode, 'default' => 'adventure')
      expect(subject.dump(nil)).to eq('adventure')
    end

  end

end
