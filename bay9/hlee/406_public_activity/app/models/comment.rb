class Comment < ActiveRecord::Base
  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller.current_user }
  #tracked
  #tracked owner: ->(controller, model) { controller && controller.current_user }
  tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }
  attr_accessible :content

  belongs_to :user
  belongs_to :recipe
end
