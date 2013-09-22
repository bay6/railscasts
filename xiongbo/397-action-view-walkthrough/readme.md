# railscasts practices --397 action view walkthrough

## struct 

_this is based on v3.2.9, 4.0 has changed a lots_

signs:
->: method call
|-: argument
<-: return

ActionView::Base
  Helpers
  ::ERB::Util
  Context

AbstractController::Rendering
  render 
    -> _normalize_render -> _normalize_args -> _normalize_options <- options
    # _normalize_args is used for converting file or action into hash
    # like options[:action] = "foo" or options[:file] = "foo/bar" or options[:partial] = "foobar"

    # _normalize_options is used for generate options[:prefixes] and options[:template]
    # the default :prefixes is current class or superclass, like %w[articles application]
    # inorder to find the view undered these prefixes
    # and the :template is options[:action] or current_action

    -> render_to_body -> _render_template
      -> view_renderer <- ActionView::Renderer.new(lookup_context)
      # view_renderer is a method that returns 

      # lookup_context is an instance of ActionView::LookupContext

        |- view_context
        view_context <- view_context_class.new(view_renderer, view_assigns, self)
        # view_context is a method that returns an instance of view class
        # which the default is a anonymous class of ActionView::Base, used as view context

        # view_assigns include instance variable which transfer from controller to view 


