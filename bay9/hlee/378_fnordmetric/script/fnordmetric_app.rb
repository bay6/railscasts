FnordMetric.namespace :store do
  hide_active_users
  
  toplist_gauge :popular_products, title: "Popular Products"
  
  distribution_gauge :popular_prices, title: "Popular Prices",
    value_ranges: [0..5, 5..10, 10..20, 20..50, 50..10000]
    
  gauge :product_views_per_second, tick: 1.second
  widget "Product Views",
    title: "Views per Second",
    type: :timeline,
    width: 100,
    gauges: :product_views_per_second,
    include_current: true,
    autoupdate: 1
  
  event :view_product do
    observe :popular_products, data[:name]
    observe :popular_prices, data[:price]
    incr :product_views_per_second
  end
end
