class Invitation
  def initialize(user)
    @user = user
  end

  def deliver(email)
    UserMailer.invitation(@user, email).deliver
    @user.increment! :invitation_count
  end

  def at_limit?
    @user.invitation_count.to_i > 5
  end
end
