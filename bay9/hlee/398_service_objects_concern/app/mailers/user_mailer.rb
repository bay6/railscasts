class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end

  def invitation(user, email)
    @user = user
    mail to: email, subject: "Invitation"
  end
end
