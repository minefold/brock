require 'spec_helper'
require 'brock/field_template'

describe Brock::FieldTemplate do

  let(:field) { stub }

  subject { described_class.new(field) }

  describe "#render" do

    it "works" do
      subject.stub(:raw) { 'My template' }
      expect(subject.render).to eq('My template')
    end

    it "exposes field methods" do
      field.stub(:name) { 'godmode' }
      subject.stub(:raw) { '<%= name %>' }
      expect(subject.render).to eq('godmode')
    end

  end

  it "figures out the correct path" do
    field.stub(type: 'string')
    subject.class.stub(:share_path) { '/' }
    expect(subject.path).to eq('/string_field.erb')
  end

end
