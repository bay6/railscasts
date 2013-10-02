class MemberProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy
  attr_accessible :email, :password_digest, :username
end
