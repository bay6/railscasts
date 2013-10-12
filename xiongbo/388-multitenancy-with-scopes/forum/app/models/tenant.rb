class Tenant < ActiveRecord::Base
  attr_accessible :name, :subdomain
end
