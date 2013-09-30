json.array!(@pages) do |page|
  json.extract! page, :name, :content, :ancestry
  json.url page_url(page, format: :json)
end
