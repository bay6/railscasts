class View < ActiveRecord::Base
  belongs_to :product
  attr_accessible :count
end
