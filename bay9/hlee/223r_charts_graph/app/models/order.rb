class Order < ActiveRecord::Base
  attr_accessible :price, :purchased_at, :shipping
end
