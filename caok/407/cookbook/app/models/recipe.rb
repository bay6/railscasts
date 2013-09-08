class Recipe < ActiveRecord::Base
  attr_accessible :description, :image_url, :name

  belongs_to :user
  has_many :comments, dependent: :destroy

  #after_create { |recipe| Activity.create! action: "create", trackable: recipe }
end
