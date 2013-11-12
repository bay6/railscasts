@products.map do |product|
  {
    name: product.name,
    price: number_to_currency(product.price),
    url: product_url(product)
  }
end.to_json
