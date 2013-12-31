class User < ActiveRecord::Base
  has_secure_password
  validates_format_of :name, with: /^\w+$/
end
