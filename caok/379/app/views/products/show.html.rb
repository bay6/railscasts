div_for @product do
  content_tag(:h1, @product.name) +
  content_tag(:p, number_to_currency(@product.price)) +
  link_to("Edit", edit_product_path(@product))
end
