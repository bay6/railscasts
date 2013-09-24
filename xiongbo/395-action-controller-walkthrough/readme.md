# rails practices --395 action controller walkthrough

## struct


Metal.action(name, klass = ActionDispatch::Request)
  -> build(action_name, app, &block)
  # build is used to wrap the block as app to the middleware stack
    -> Metal.new.dispatch(name, klass.new(env)) <- response
    # used to generate some variables and process action and return the response
      -> AbstractController::Base#process(action, *args)
        -> method_for_action(action_name)
        -> process_action(action_name, *args)
          -> send_action: send

# most features are design as modules that include into ActionController::Base
ActionController::Base::RackDelegation
  -> dispatch(action, request, response = ActionDispatch::Reponse.new)
  # this method override the upper dispatch

!!! when you include modules, they are injected into inheritance chain
