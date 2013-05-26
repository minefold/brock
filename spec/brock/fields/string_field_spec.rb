require 'spec_helper'
require 'brock/fields/Text_field'

describe Brock::Fields::TextField do
  subject { described_class.new(:whitelist) }

  describe "#default" do

    it "defaults to an empty string" do
      expect(subject.default).to eq('')
    end

  end

end
