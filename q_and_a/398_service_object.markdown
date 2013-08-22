q and a

* why should use has_secure_password in included callback
* why the namespace should as the same as directionary
* user = create(:user, username: 'xxx', password: 'xxx') how to explain create?
* which is better between UserFormat.new(@users).csv and @users.to_csv?
* new User.find_by_email(email) why we should use new?
* 

#### tap 是ruby 还是rails 用法

看着不眼熟啊，什么情况下用

```ruby
  @user = User.where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth[:provider]
    user.uid = auth[:uid]
    user.username = auth[:info][:nickname]
    user.save!
  end
```

#### about assets pipeline

[question about asset path](general_question.markdown)

[asset pipeline resource](http://guides.rubyonrails.org/asset_pipeline.html)


#### rspec `be_authenticated`

```ruby
      Authentication.new(username: 'foobar', password: 'secret').should be_authenticated
```

where this method from?
