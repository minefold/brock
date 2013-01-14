require 'spec_helper'
require 'brock/html_renderer'

RSpec::Matchers.define :match_html do |expected|
  def strip_non_html(s)
    s.gsub(/^\s+/,'').gsub("\n",'')
  end

  match do |actual|
    strip_non_html(expected) == strip_non_html(actual)
  end

  failure_message_for_should do |actual|
    "expected that:\n#{actual} would match:\n#{expected}"
  end
end

describe Brock::HtmlRenderer do
  subject { Brock::HtmlRenderer.new }

  it "renders string setting" do
    html = subject.setting(
      'type' => 'string',
      'name' => 'seed',
      'label' => 'Seed',
      'description' => 'Generates the world',
      'default' => '12345'
    )
    html.should match_html %Q{
      <div class="control-group">
        <label class="control-label" for="seed">Seed</label>
        <div class="controls">
          <input type="text" class="span6" name="seed" placeholder="12345">
          <span class="help-block">Generates the world</span>
        </div>
      </div>
    }
  end

  it "renders integer setting" do
    html = subject.setting(
      'type' => 'integer',
      'name' => 'rounds',
      'label' => 'Rounds',
      'default' => '5')
    html.should match_html %Q{
      <div class="control-group">
        <label class="control-label" for="rounds">Rounds</label>
        <div class="controls">
          <input type="text" class="span6" name="rounds" placeholder="5">
          <span class="help-block"></span>
        </div>
      </div>
    }
  end

  it "renders multiline setting" do
    html = subject.setting(
      'type' => 'multiline',
      'name' => 'whitelist',
      'label' => 'Whitelist')
    html.should match_html %Q{
      <div class="control-group">
        <label class="control-label" for="whitelist">Whitelist</label>
        <div class="controls">
          <textarea class="span6" name="whitelist" placeholder=""></textarea>
          <span class="help-block"></span>
        </div>
      </div>
    }
  end

end
