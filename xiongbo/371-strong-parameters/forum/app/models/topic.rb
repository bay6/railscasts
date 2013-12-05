class Topic < ActiveRecord::Base
  has_many :posts
  accepts_nested_attributes_for :posts

  attr_accessible :name, as: :user
  attr_accessible :name, :sticky, as: :admin
end
