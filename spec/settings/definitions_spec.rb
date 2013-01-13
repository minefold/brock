require 'spec_helper'
require 'funpack_settings/definitions'

describe FunpackSettings::Definitions do
  def defs(defs)
    FunpackSettings::Definitions.new(defs)
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
