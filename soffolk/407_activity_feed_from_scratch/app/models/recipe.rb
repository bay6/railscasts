class Recipe < ActiveRecord::Base
  attr_accessible :description, :image_url, :name

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :activities, as: :trackable
end
