require 'spec_helper'
require 'json'
require 'brock/schema'

describe Brock::Schema do
  let(:data) { JSON.parse(fixture('minecraft-essentials.json')) }
  subject { described_class.build(data) }

  it "#has_field? looks up fields by name" do
    expect(subject.has_field?(:whitelist)).to be_true
  end

end

