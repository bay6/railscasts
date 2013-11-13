require "fnordmetric"

FnordMetric.namespace :store do
  hide_active_users
  
  toplist_gauge :popular_products, title: "Popular Products"
  
  distribution_gauge :popular_prices, title: "Popular Prices",
    value_ranges: [0..5, 5..10, 10..20, 20..50, 50..10000]
  
  event :view_product do
    observe :popular_products, data[:name]
    observe :popular_prices, data[:price]
  end
end

FnordMetric::Web.new(port: 4242)
FnordMetric::Worker.new
FnordMetric.run
