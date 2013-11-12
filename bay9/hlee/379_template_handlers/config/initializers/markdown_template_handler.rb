class MarkdownTemplateHandler
  def self.call(template)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true 
    }
    Redcarpet::Markdown.new(renderer, options).render(template.source).inspect
  end
end
ActionView::Template.register_template_handler(:md, MarkdownTemplateHandler)
ActionView::Template.register_template_handler(:markdown, MarkdownTemplateHandler)

