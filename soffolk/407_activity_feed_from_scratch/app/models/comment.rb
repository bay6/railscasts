class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  belongs_to :recipe
  has_many :activities, as: :trackable
end
