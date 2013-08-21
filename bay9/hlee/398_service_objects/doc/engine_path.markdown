In Rails::Engine which is included in the Rails application's module, there is the following method:

```ruby
def _all_autoload_paths
  @_all_autoload_paths ||= (config.autoload_paths + config.eager_load_paths + config.autoload_once_paths).uniq
end
```

So, you could either do:
```ruby
(MyRailsApp::Application.config.autoload_paths + MyRailsApp::Application.config.eager_load_paths + MyRailsApp::Application.config.autoload_once_paths).uniq
```
or:

```ruby
[:autoload_paths, :eager_load_paths, :autoload_once_paths].collect{|m|MyRailsApp::Application.config.send(m)}.flatten.uniq
```
or just:

MyRailsApp::Application._all_autoload_paths
The default result in Rails 3.2.9 is:

```ruby
["/path/to/my_rails_app/app/assets", "/path/to/my_rails_app/app/controllers", "/path/to/my_rails_app/app/helpers", "/path/to/my_rails_app/app/mailers", "/path/to/my_rails_app/app/models"]
```

This should include all the autoload paths that were added by other gems and custom load paths.
