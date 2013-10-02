class GuestProfile < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :user, as: :profile, dependent: :destroy

  def guest?
    true
  end
  
  def move_to(user)
    tasks.update_all(user_id: user.id)
  end

  def name
    "Guest"
  end

  def task_limit
    10
  end

  def can_share_task?(task)
    false
  end

  def send_password_reset
  end

  def become_member(member_profile)
    user.profile = member_profile
    user.save!
  end
end
