class User < ActiveRecord::Base
  include Authentication
  include Searchable
  include CsvConversion
  include Invitation
  include PasswordResettable

  attr_accessible :email, :username, :password, :password_confirmation

  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates_confirmation_of :password 
end
