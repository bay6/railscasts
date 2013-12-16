class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks

  def completed_tasks
    tasks.where(completed: true)
  end

  def uncompleted_tasks
    tasks.where(completed: false)
  end
end
