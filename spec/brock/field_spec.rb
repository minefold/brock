require 'spec_helper'
require 'brock/field'

describe Brock::Field do

  subject {
    described_class.new(
      'type' => 'str',
      'name' => 'a',
      'label' => 'A',
      'default' => 'a'
    )
  }

  it "#type is a symbol" do
    expect(subject.type).to be_a(Symbol)
  end

  it "#name is a symbol" do
    expect(subject.type).to be_a(Symbol)
  end

  it "#parse_param raises by default" do
    expect {
      subject.parse_param(nil)
    }.to raise_error(Brock::ParamParseError)
  end

end