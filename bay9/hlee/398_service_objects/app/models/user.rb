#load 'concerns/users/authentication.rb'
class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation

  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates_confirmation_of :password

  include Authentication
  include Searchable
  include CsvConversion
  include Inviter
  include PasswordResettable



end
