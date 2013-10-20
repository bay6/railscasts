class Task < ActiveRecord::Base
  attr_accessible :name, :completed_at
  belongs_to :project, touch: true
end
