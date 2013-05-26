module Brock
  class Settings

    attr_reader :schema

    def initialize(schema)
      @schema = schema
    end

    def load(vals)
      schema.fields.each_with_object({}) do |field, result|
        result[field.name] = field.load(vals[field.name])
      end
    end

    def dump(vals)
      schema.fields.each_with_object({}) do |field, result|
        result[field.name] = field.dump(vals[field.name])
      end
    end

  end
end
