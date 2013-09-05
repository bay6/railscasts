class Comment < ActiveRecord::Base
  include PublicActivity::Common
  attr_accessible :content

  belongs_to :user
  belongs_to :recipe
end
