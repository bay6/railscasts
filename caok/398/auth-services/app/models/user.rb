class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation

  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates_confirmation_of :password

  has_secure_password
end
