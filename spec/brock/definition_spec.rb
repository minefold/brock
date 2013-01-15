require 'spec_helper'
require 'brock/definition'

describe Brock::Definition do

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
      }
    ]
  }

  subject { described_class.new(data) }

  it "initializes fields" do
    expect { subject }.to_not raise_error(Brock::FieldTypeNotSupported)
  end

end

