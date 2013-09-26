### action view

```ruby
def find(name, prefixes = [], partial = false, keys = [], options = {})
  @view_paths.find(*args_for_lookup(name, prefixes, partial, keys, options))
end
alias :find_template :find
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
