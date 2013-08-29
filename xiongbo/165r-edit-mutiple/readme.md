# rails casts practices --165 edit multiple

## resources
1. [update, update_all](http://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-update) 
*update_all will not trigger callback and validation*

## nice code

```ruby
@products.reject! do |p|
  p.update_attributes(params[:product].reject! { |k,v| v.blank? })
end
```
