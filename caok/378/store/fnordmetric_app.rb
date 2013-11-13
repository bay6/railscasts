require "fnordmetric"

FnordMetric.namespace :store do
  toplist_gauge :popular_products, title: "Popular Products"

  event :view_product do
    observe :popular_products, data[:name]
  end
end

FnordMetric::Web.new(port: 4242)
FnordMetric::Worker.new
FnordMetric.run
