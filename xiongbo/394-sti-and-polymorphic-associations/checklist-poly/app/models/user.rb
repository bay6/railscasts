class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  attr_accessible :username, :email, :password, :password_confirmation

  validates_presence_of :username, :email, :password_digest, unless: :guest?
  validates_uniqueness_of :username, allow_blank: true
  validates_confirmation_of :password

  # override has_secure_password to customize validation until Rails 4.
  require 'bcrypt'
  attr_reader :password
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation
  
  def self.new_guest
    new { |u| u.guest = true }
  end
  
  def move_to(user)
    tasks.update_all(user_id: user.id)
  end
  
  def name
    guest ? "Guest" : username
  end

  # def task_limit
  #   guest ? 10 : 1000
  # end
  # 
  # def can_share_task?(task)
  #   task.user_id == id && !guest?
  # end
  # 
  # def send_password_reset
  #   UserMailer.password_reset(self).deliver unless guest?
  # end
end
