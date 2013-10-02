class MemberProfile < ActiveRecord::Base
  attr_accessible :email, :password_digest, :username
end
