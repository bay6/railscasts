class User < ActiveRecord::Base
  has_many :tasks

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

  def name
    guest ? "Guest" : username
  end
end
