# rails casts practices --229r polling for changes

## code tips
1. `render @comments` is the convenience of

```ruby
<%= @comments.each do |comment| %>
  <%= render comment %> # this will looks for 'views/comments/_comment.html.erb'
<% end %>
```

2. `<%= j render(@comments) %>)` j is alias of escape_javascript
