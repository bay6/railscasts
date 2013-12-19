class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation
  validates_uniqueness_of :name

  has_many :haikus
  def total_votes
    HaikuVote.joins(:haiku).where(haikus: {user_id: self.id}).sum('value')
  end
end
