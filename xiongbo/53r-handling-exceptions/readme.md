# rails casts practice --53r Handling Exceptions

## resources
1. [exception wrapper](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/exception_wrapper.rb)


## attention

1. exception code

```ruby
def self.status_code_for_exception(class_name)
  Rack::Utils.status_code(@@rescue_responses[class_name])
end
```

