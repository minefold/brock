require 'spec_helper'
require 'brock/fields/string_field'

describe Brock::Fields::StringField do
  subject { described_class.new(:mode) }

  it "is a StringField" do
    expect(subject).to be_a(Brock::Fields::StringField)
  end

end
