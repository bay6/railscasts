module PagesHelper
  def nested_page_path(page)
    '/' + (page.ancestors + [page]).map(&:to_param).join('/')
  end
end
