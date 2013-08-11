module ApplicationHelper

  def markdown(text)
    raw $markdown.render(text)
  end

end
