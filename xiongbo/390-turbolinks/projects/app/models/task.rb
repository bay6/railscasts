class Task < ActiveRecord::Base
  belongs_to :project
  attr_accessible :complete, :name, :project_id
end
