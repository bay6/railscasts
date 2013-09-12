class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks

  def incomplete_tasks
    tasks.where(completed_at: nil)
  end

  def complete_tasks
    tasks.where('completed_at is not null')
  end
end
