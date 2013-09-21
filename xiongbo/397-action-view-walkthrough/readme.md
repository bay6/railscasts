# railscasts practices --397 action view walkthrough

## struct 

_this is based on v3.2.9, 4.0 has changed a lots_

ActionView::Base
  Helpers
  ::ERB::Util
  Context

AbstractController::Rendering
  render 
    -> _normalize_render -> _normalize_args -> normalize_options
    -> _render_template
      lookup_context
      view_renderer
      view_context
