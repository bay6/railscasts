json.array!(@books) do |book|
  json.extract! book, :name, :price
  json.url book_url(book, format: :json)
end
