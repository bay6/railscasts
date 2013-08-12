preunion
=====

##目标

本系统旨在搭建一个工会任务和团队管理系统。

工会成员可以通过本系统加入团队，领取任务，完成任务。

我们希望通过本系统能够让更多人感受到编码的快乐，并获得一些提高。


## Demo

  http://thawing-basin-6896.herokuapp.com/

### 设置管理员帐号

复制config/setting.yml.sample为config/setting.yml

将管理员的邮箱(需要小写)加到里面:

```
defaults: &defaults
  admin_emails:
    - "admin@admin.com"
    - "williamnewbie@gmail.com"
...
```

### 贡献

1. folk it
2. `cp config/database.yml.example config/database.yml`
3. `cp config/initializers/secret_token.rb.example config/initializers/secret_token.rb`
4. implementation your awsome feature
5. create pull request



