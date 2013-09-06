class Comment < ActiveRecord::Base
  include PublicActivity::Common
  #tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :content

  belongs_to :user
  belongs_to :recipe
end
