### action view

```ruby
# Main render entry point shared by AV and AC.
def render(context, options)
  if options.key?(:partial)
    render_partial(context, options)
  else
    render_template(context, options)
  end
end
```
