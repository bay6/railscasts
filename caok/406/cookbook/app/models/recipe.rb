class Recipe < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  attr_accessible :description, :image_url, :name

  belongs_to :user
  has_many :comments, dependent: :destroy
end
