class Guest < User
  def guest?
    true
  end

  def move_to(user)
    tasks.update_all(user_id: user.id)
  end

  def name
    "Guest"
  end

  # def task_limit
  #   10
  # end
  # 
  # def can_share_task?(task)
  #   false
  # end
  # 
  # def send_password_reset
  # end
end
