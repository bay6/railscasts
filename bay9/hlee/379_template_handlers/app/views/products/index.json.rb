@products.map do |product|
  {
    name: product.name,
    price: number_to_currency(product.price),
    url: product_url(product),
    reviews: product.reviews.map do |r|
      {
        name: r.name
      }
    end
  }
end.to_json
