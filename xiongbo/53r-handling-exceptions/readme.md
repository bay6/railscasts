# rails casts practice --53r Handling Exceptions

## resources

[rescue_from](https://github.com/rails/rails/blob/f62fb985b6a7b90872148f0786219c9cc94c9356/activesupport/lib/active_support/rescuable.rb)
[show_exception](https://github.com/rails/rails/blob/411de5ae379190613d86032d7bad53ec0191653a/actionpack/lib/action_dispatch/middleware/show_exceptions.rb)


# attention
1. dynamic action
```ruby
  render action: request.path[1..-1]
```
