class Tasks < ActiveRecord::Base
  belongs_to :project
  attr_accessible :complete, :name
end
