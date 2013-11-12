xml.instruct! :xml, version: "1.0" 
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Products"
    xml.description "Our product listing"
    xml.link products_url

    @products.each do |product|
      xml.item do
        xml.title product.name
        xml.description number_to_currency(product.price)
        xml.pubDate product.released_on.to_s(:rfc822)
        xml.link product_url(product)
        xml.guid product_url(product)
      end
    end
  end
end
