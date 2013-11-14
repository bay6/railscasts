class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_on, :category_id
  belongs_to :category

  def trigger_view_event
    FNORD_METRIC.event(attributes.merge(type: :view_product))
  end
end
