require 'csv'

CSV.generate do |csv|
  csv << ["Name", "Price", "URL"]
  @products.each do |p|
    csv << [
      p.name,
      number_to_currency(p.price),
      product_url(p)
    ]
  end
end
