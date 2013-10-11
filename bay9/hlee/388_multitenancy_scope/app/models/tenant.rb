class Tenant < ActiveRecord::Base
  attr_accessible :name, :subdomain
  has_many :topics
  
  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end
  
  def self.current_id
    Thread.current[:tenant_id]
  end
end
