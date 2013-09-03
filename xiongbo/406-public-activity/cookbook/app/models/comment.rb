class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  attr_accessible :content

  belongs_to :user
  belongs_to :recipe
end
