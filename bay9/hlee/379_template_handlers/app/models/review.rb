class Review < ActiveRecord::Base
  belongs_to :product
  attr_accessible :name
end
