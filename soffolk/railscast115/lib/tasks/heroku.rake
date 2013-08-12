namespace :heroku do
  desc 'copy config file' 
  task :init_config do
    p 'copy config/setting.yml' 
    `cp config/setting.yml.sample config/setting.yml`
    p 'copy config/initializers/secret_token.rb'
    `cp config/initializers/secret_token.rb.example config/initializers/secret_token.rb`
    p `ls config/setting.yml`
    p `ls config/initializers/secret_token.rb`
  end
end
