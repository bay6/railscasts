# rails casts practice --407 activity feed from scratch

## resources
1. [lookup_context](api.rubyonrails.org/classes/ActionView/LookupContext/ViewPaths.html)

## code tips

```ruby
rails g resource activity user:belongs_to trackable:belongs_to trackable_type

partial_paths.detect do |path|
  lookup_context.exists? path, nil, true
end || raise("")
```
