json.array!(@articles) do |article|
  json.extract! article, :name, :content, :published_at
  json.url article_url(article, format: :json)
end
