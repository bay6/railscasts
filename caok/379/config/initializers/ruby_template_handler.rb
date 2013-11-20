handler = ->(template) { "Date.today.to_s" }
ActionView::Template.register_template_handler(:rb, handler)
