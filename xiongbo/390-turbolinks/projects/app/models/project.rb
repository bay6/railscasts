class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks

  def incomplete_tasks
    tasks.where(complete: false)
  end

  def complete_tasks
    tasks.where(complete: true)
  end
end
