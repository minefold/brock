require 'spec_helper'
require 'brock/definitions'

describe Brock::Definitions do
  def defs(defs)
    Brock::Definitions.new(defs)
  end

  it "uses default when no value is present" do
    defs([{
        'type' => 'string',
        'name' => 'motd',
        'default' => 'oh hai'
      }
    ]).to_h().should == {
      'motd' => 'oh hai'
    }
  end
end
