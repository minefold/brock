require 'erb'
require 'brock/field_template_context'

module Brock
  class FieldTemplate

    def self.share_path
      # __FILE__ is a special variable that is inlined at compile time so its value is this path to this file, not a subclasses'.
      File.expand_path('../../../share', __FILE__)
    end

    attr_reader :field

    def initialize(field)
      @field = field
    end

    def render(value = nil)
      ctx = FieldTemplateContext.new(@field, value)
      ERB.new(raw).result(ctx.binding)
    end

  # private

    def raw
      File.read(path)
    end

    def path
      File.join(self.class.share_path, "#{field.class.type}_field.erb")
    end

  end
end
