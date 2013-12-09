class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :product
  # attr_accessible :title, :body
end
