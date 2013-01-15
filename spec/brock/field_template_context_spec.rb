require 'spec_helper'
require 'brock/field_template_context'

describe Brock::FieldTemplateContext do

  let(:field) { stub(name: 'field_name') }

  subject { described_class.new(field, 5) }

  it "delegates to the field" do
    expect(subject.name).to eq('field_name')
  end

  it "has a value" do
    expect(subject.value).to eq(5)
  end

  it "doesn't accidentally override the passed value" do
    field.stub(:value) { 6 }
    expect(subject.value).to eq(5)
  end

  it "#binding is public" do
    expect(subject.binding).to be_a(Binding)
  end

end
