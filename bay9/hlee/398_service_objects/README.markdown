# Learning 

* authload_paths
`config.autoload_paths += %W(#{config.root}/lib)`

I just mis type as w and it will not interpreter it. 

which is equal:

```ruby
#ApplicationController

Dir["lib/**/*.rb"].each do |path|
  require_dependency path
end
```

also can check as below:

```ruby
$ rails c
Loading development environment (Rails 3.2.9)
1.9.3p194 :001 > MyRailsApp::Application.config.autoload_paths
=> [] 
```

[Rails Engine Path](doc/engine_path.markdown)
