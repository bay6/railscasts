class Team < ActiveRecord::Base
  include CacheQuery
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true

  def has_joined? user
    cache_users.include?(user)
  end
end
