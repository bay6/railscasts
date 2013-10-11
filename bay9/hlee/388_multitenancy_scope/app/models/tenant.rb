class Tenant < ActiveRecord::Base
  attr_accessible :name, :subdomain
  has_many :topics
end
