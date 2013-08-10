#### Q1

```ruby
class Person
  include ActiveMode::Model
  attr_accessor :id, :name, :omg
end
```

Will this attributes associate with database?


#### Q2

`persisted?` vs `new_record?` any relation?

#### Q3

Why we don't need `changing_password` as attributes?


#### Q4

`accepts_nested_attributes_for :profile` why we don't need it again?

#### Q5

What should we do to replace `params[:user]` with `params[signup_form]`