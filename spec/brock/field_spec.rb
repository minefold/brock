require 'spec_helper'
require 'brock/field'

describe Brock::Field do

  subject {
    described_class.new(
      'name' => 'a',
      'label' => 'A'
    )
  }

  it "#name is a symbol" do
    expect(subject.name).to be_a(Symbol)
  end

  it "#parse_param raises by default" do
    expect {
      subject.parse_param(nil)
    }.to raise_error(Brock::ParamParseError)
  end

  it "defaults are optional" do
    expect(subject.default).to eq(nil)
  end

end
