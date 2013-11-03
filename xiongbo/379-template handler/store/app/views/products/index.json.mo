
@products.map do |product|
  {
    name: product.name,
    price: number_to_currency(product.price),
    url: product_url(product),
    views: product.views.map { |v| JSON.parse(render(v)) }
  }
end.to_json
