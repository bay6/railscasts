class GuestProfile < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :user, as: :profile, dependent: :destroy
end
