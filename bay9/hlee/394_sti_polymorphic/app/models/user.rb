class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  attr_accessible :username, :email, :password, :password_confirmation

  validates_presence_of :username, :email
  validates_uniqueness_of :username, allow_blank: true

  has_secure_password
  
  def guest?
    false
  end
    
  def name
    username
  end

  def task_limit
    1000
  end
  
  def can_share_task?(task)
    task.user_id == id
  end
  
  def send_password_reset
    UserMailer.password_reset(self).deliver
  end
end
