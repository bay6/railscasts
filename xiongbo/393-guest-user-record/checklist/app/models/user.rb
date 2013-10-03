class User < ActiveRecord::Base
  has_many :tasks

  attr_accessible :username, :email, :password, :password_confirmation

  validates_presence_of :username, :email
  validates_uniqueness_of :username

  has_secure_password

  def self.new_guest
    new {|u| u.guest = true}
  end
end
