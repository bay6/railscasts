# railscasts practices --397 action view walkthrough

## struct 

_this is based on v3.2.9, 4.0 has changed a lots_

signs:
->: method call
=>: implement
|-: argument
<-: return
: delegate
= alias

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

    -> render_to_body -> _render_template -> view_renderer.render
      -> view_renderer <- ActionView::Renderer.new(lookup_context)
      # ActionView::Rendrer is the main entry point for rendering.
      # it delegate to TemplateRenderer and ParitialRenderer to actually renders the template

        -> TemplateRender#render 
          -> determine_template <- tempalte 
            # if options[:template].respond_to?(:render) then options[:template] otherwise
            -> find_template:lookup_context=find -> view_path#find -> PathSet#find_all 
            -> Resolver#find_all -> find_templates => PathResolver#find_template 
            -> query -> Template.new(contents, File.expand_path(template), handler,
                                      :virtual_path => path.virtual,
                                      :format => format,
                                      :updated_at => mtime(template))
            # ie: action.html.erb, format: html, handler: erb

          -> render_template(template, options[:layout], options[:locals])
            -> render_with_layout
              -> template.render <- content
                -> Template#compile!(view) -> compile(view, mod) -> mod.module_eval
                -> Template#view.send
              -> layout.render


      # lookup_context is an instance of ActionView::LookupContext

        |- view_context
        view_context <- view_context_class.new(view_renderer, view_assigns, self)
        # view_context is a method that returns an instance of view class
        # which the default is a anonymous class of ActionView::Base, used as view context

        # view_assigns include instance variable which transfer from controller to view 


