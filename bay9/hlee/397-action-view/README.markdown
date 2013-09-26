### action view

```ruby
def find(name, prefixes = [], partial = false, keys = [], options = {})
  @view_paths.find(*args_for_lookup(name, prefixes, partial, keys, options))
end
alias :find_template :find


def find(*args)
  find_all(*args).first || raise(MissingTemplate.new(self, *args))
end

def find_all(path, prefixes = [], *args)
  prefixes = [prefixes] if String === prefixes
  prefixes.each do |prefix|
    paths.each do |resolver|
      templates = resolver.find_all(path, prefix, *args)
      return templates unless templates.empty?
    end
  end
  []
end

# Normalizes the arguments and passes it on to find_template.
def find_all(name, prefix=nil, partial=false, details={}, key=nil, locals=[])
  cached(key, [name, prefix, partial], details, locals) do
    find_templates(name, prefix, partial, details)
  end
end

def render_template(template, layout_name = nil, locals = {})
  view, locals = @view, locals || {}

  render_with_layout(layout_name, locals) do |layout|
    instrument(:template, :identifier => template.identifier, :layout => layout.try(:virtual_path)) do
    template.render(view, locals) { |*name| view._layout_for(*name) }
    end
  end
end

def render(view, locals, buffer=nil, &block)
  ActiveSupport::Notifications.instrument("!render_template.action_view", :virtual_path => @virtual_path) do
    compile!(view)
    view.send(method_name, locals, buffer, &block)
  end
rescue Exception => e
  handle_render_error(view, e)
end
```


```ruby
# Main render entry point shared by AV and AC.
def render(context, options)
  if options.key?(:partial)
    render_partial(context, options)
  else
    render_template(context, options)
  end
end

def determine_template(options) #:nodoc:
  keys = options[:locals].try(:keys) || []

  if options.key?(:text)
    Template::Text.new(options[:text], formats.try(:first))
  elsif options.key?(:file)
    with_fallbacks { find_template(options[:file], nil, false, keys, @details) }
  elsif options.key?(:inline)
    handler = Template.handler_for_extension(options[:type] || "erb")
    Template.new(options[:inline], "inline template", handler, :locals => keys)
  elsif options.key?(:template)
    options[:template].respond_to?(:render) ?
          options[:template] : find_template(options[:template], options[:prefixes], false, keys, @details)
  else
    raise ArgumentError, "You invoked render but did not give any of :partial, :template, :inline, :file or :text option."
  end
end
```
