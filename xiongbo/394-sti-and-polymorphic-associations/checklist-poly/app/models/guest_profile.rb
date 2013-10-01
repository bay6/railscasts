class GuestProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy

  def guest?
    true
  end

  def become_member member_profile
    user.profile = member_profile
    user.save!
  end

  def name
    "Guest"
  end

  def task_limit
    10
  end

  def can_share_task? task
    false
  end

  def send_password_reset 
  end
end
