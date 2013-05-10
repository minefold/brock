require 'spec_helper'
require 'brock/schema'

describe Brock::Schema do

  let(:data) {
    [
      {
        "name" => "mp_maxrounds",
        "type" => "integer",
        "label" => "Max Rounds",
        "description" => "Maximum number of rounds to play before server changes maps.",
        "default" => 5
      }, {
        "name" => "mp_autoteambalance",
        "type" => "boolean",
        "label" => "Auto Team Balance",
        "default" => true
      }, {
        "name" => "first_name",
        "label" => "First name",
        "default" => "Chris"
      }
    ]
  }

  subject { described_class.new(data) }

  it "initializes fields" do
    expect { subject }.to_not raise_error(Brock::FieldTypeNotSupported)
  end

  {
    {"name" => "a"} => Brock::StringField,
    {"name" => "a", "values" => []} => Brock::SelectField,
    {"name" => "a", "type" => "string", "values" => []} => Brock::SelectField
  }.each do |raw, klass|
    it ".field_for matches a shortcut to #{klass}" do
      described_class.field_for(raw).should be_a(klass)
    end
  end

  it "#to_hash" do
    expect(subject.to_hash).to eq(
      'mp_maxrounds' => 5,
      'mp_autoteambalance' => true,
      'first_name' => 'Chris'
    )
  end

  it "#to_hash takes params" do
    expect(subject.to_hash('first_name' => 'Dave')).to eq(
      'mp_maxrounds' => 5,
      'mp_autoteambalance' => true,
      'first_name' => 'Dave'
    )
  end

end

