# rails casts practices --398 service objects

## q and a
1. why should use has_secure_password in included callback

这个就是加载一个功能模块吧。不放到concern之前是直接加。放到concern里后，是在include的时候，加载，就是hook上次说的。不加的话不能得到password加密的功能 

2. why the namespace should as the same as directionary
 

3. `user = create(:user, username: 'xxx', password: 'xxx')` how to explain create?

`FactoryGirl`

4. which is better between `UserFormat.new(@users).csv` and @users.to_csv?
5. `new User.find_by_email(email)` why we should use new?

```ruby
def self.from_email(email)
    PasswordReset.new(User.find_by_email(email))
end
```


 


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

# in user model
@user.increment! :invitation_count
```

## approach
1. to seperate common method into module with concern
2. to seperate domain logic into class
