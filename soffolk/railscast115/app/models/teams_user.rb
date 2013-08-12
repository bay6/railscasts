class TeamsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  validates :user_id, uniqueness: { scope: :team_id }
end
