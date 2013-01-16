require 'brock/field'

shared_examples "a field" do

  let(:default_fixture) { "#{described_class.type}_field.html" }

  it "is a Brock::Field" do
    expect(subject).to be_a(Brock::Field)
  end

  it ".type is a symbol" do
    expect(described_class.type).to be_a(Symbol)
  end

  it '.detect with same type' do
    expect(described_class.detect('type' => described_class.type.to_s))
  end

  it "#name is a symbol" do
    expect(subject.name).to be_a(Symbol)
  end

  it "#to_html matches the fixture" do
    scrubbed_html = scrub_html(subject.to_html)
    scrubbed_fixture = scrub_html(fixture(default_fixture))
    expect(scrubbed_html).to eq(scrubbed_fixture)
  end

end
