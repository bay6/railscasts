# rails casts practices --398 service objects

## q and a
1. why should use has_secure_password in included callback
2. why the namespace should as the same as directionary
3. `user = create(:user, username: 'xxx', password: 'xxx')`

## resources
[concern,include,extend](http://www.zhlwish.com/2012/07/23/rails-activesupport-concern/)

## code to be attention

```ruby
# in authentication
User.where().first_or_initialize.tap {}
# first_or_initialize like first_or_create but use new instead of create
# tap is used to tap the object into block and then return the object, most use in method chain

# in User spec
user = create(:user, username: 'xxx', password: 'xxx')
```

## approach
1. to seperate common method into module with concern
2. to seperate domain logic into class
