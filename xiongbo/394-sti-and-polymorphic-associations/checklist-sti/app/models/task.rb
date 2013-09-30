class Task < ActiveRecord::Base
  belongs_to :member

  attr_accessible :complete, :name
end
