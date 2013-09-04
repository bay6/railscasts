class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable
  attr_accessible :action, :trackable_type
end
