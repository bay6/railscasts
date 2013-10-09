class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :password, :password_confirmation, :time_zone

  validates_uniqueness_of :name
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

  has_many :haikus
end
