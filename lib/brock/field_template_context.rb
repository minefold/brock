module Brock
  class FieldTemplateContext

    attr_reader :value

    def initialize(field, value)
      @field = field
      @value = value
    end

    def binding
      super
    end

    def method_missing(method, *args, &blk)
      if @field and @field.respond_to?(method)
        @field.send(method, *args, &blk)
      else
        super(*args, &blk)
      end
    end

  end
end
