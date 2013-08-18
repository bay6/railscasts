# RailsCasts Example Application

Run these commands to try it out.

```
bundle
rake db:setup
rails s
```

Requires Ruby 1.9.2 or later to run.



rake middleware

config.exceptions_app sets the exceptions application invoked by the ShowException middleware when an exception happens. Defaults to ActionDispatch::PublicExceptions.new(Rails.public_path).

  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/} # via: :all

### references
* http://rubydoc.info/github/rack/rack/master/Rack/Utils
* http://guides.rubyonrails.org/configuring.html
* https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/exception_wrapper.rb
* http://api.rubyonrails.org/classes/ActiveSupport/Rescuable/ClassMethods.html#method-i-rescue_from


