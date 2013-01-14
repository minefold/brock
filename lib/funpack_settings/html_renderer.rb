module FunpackSettings
  class HtmlRenderer

    def setting(setting)
      if setting['values']
        if setting['values'].any?{|s| s['description'] }
          radio(setting)
        else
          select(setting)
        end
      else
        send setting['type'], setting
      end
    end

    def string(s)
      control_group(s) do
        controls(s) do
          %Q{<input type="text" class="span6" name="#{s['name']}" placeholder="#{s['hint'] || s['default']}">}
        end
      end
    end

    def integer(s)
      string(s)
    end

    def multiline(s)
      control_group(s) do
        controls(s) do
          %Q{<textarea class="span6" name="#{s['name']}" placeholder="#{s['hint'] || s['default']}"></textarea>}
        end
      end
    end

    def url(s)
      control_group(s) do
        controls(s) do
          %Q{<div class="input-prepend">
              <span class="add-on">URL</span>
              <input class="span6" type="text" name="#{s['name']}" placeholder="#{s['hint'] || s['default']}">
            </input>}
        end
      end
    end

    def radio(s)
      options = s['values'].map do |opt|
        opt_id = "#{s['name']}-#{opt['value']}".downcase
        %Q{<div class='controls'>
            <label class="radio" for="#{opt_id}">
              <input id="#{opt_id}" type="radio" value="#{opt['value']}" name="#{s['name']}" #{opt['value'] == s['default'] ? 'checked' : ''} />
              #{opt['label']}
              <p class='help-block'>
                #{opt['description']}
              </p>
            </label>
          </div>}
      end
      name = s['name']
      control_group(s) do
        options.join("\n")
      end
    end

    def select(s)
      options = s['values'].map do |opt|
        %Q{<option value=#{opt['value']} #{opt['value'] == s['default'] ? 'selected' : ''}>#{opt['label']}</option>}
      end
      control_group(s) do
        %Q{<div class="controls">
            <select name="#{s['name']}" value="#{s['default']}">
              #{options.join("\n")}
            </select>
          </div>}
      end
    end

    def boolean(s)
      if s['description'] || s['hint']
        boolean_group(s)
      else
        boolean_single(s)
      end
    end

    def boolean_group(s)
      control_group(s) do
        controls(s['hint']) do
          %Q{<label class="checkbox">
              <input type="checkbox" name="#{s['name']}" #{s['default'] ? 'checked' : ''}">
              #{s['description']}
            </label>}
        end
      end
    end

    def boolean_single(s)
      %Q{<div class="controls">
          <label class="checkbox">
            <input type="checkbox" name="#{s['name']}" #{s['default'] ? 'checked' : ''}">
            #{s['label']}
          </label>
        </div>}
    end

  # private

    def control_group(s)
      %Q{<div class="control-group">
          <label class="control-label" for="#{s['name']}">#{s['label']}</label>
          #{yield}
        </div>}
    end

    def controls(s)
      %Q{<div class="controls">
          #{yield}
          #{help_block(s)}
        </div>}
    end

    def help_block(s)
      %Q{<span class="help-block">#{s ? s['description'] : s}</span>}
    end

  end
end
