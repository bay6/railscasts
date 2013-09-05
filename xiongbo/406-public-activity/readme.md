# rails casts practice --406 public activity

## resources
1. [helper_method: declare a controller method as a helper to use in the view](http://apidock.com/rails/ActionController/Helpers/ClassMethods/helper_method)

2. 

## differences to cast

```ruby
<div class="activity">
<%= link_to activity.owner.name, activity.owner if activity.owner %>
  added comment to <%= link_to activity.trackable.recipe.name, activity.trackable.recipe if activity.trackable.class.to_s == "Comment" %>
</div>
```
