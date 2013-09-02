# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :name, :password, :password_confirmation
  
  validates_uniqueness_of :name

  has_many :recipes
  has_many :comments
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :activities
end
