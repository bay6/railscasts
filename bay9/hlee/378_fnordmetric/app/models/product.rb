class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_on

  def trigger_view_event
    FNORD_METRIC.event(attributes.merge(_type: :view_product))    
  end
end
