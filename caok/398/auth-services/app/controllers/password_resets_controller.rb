class PasswordResetsController < ApplicationController
  def new
  end

  def create
    password_reset = PasswordReset.from_email(params[:email])
    if password_reset.user
      password_reset.send_email
      redirect_to root_url, notice: "Email sent with password reset instructions."
    else
      redirect_to new_password_reset_url, alert: "Email address does not match a user account."
    end
  end

  def edit
    password_reset = PasswordReset.from_token(params[:id])
    @user = password_reset.user
  end

  def update
    password_reset = PasswordReset.from_token(params[:id])
    @user = password_reset.user
    if password_reset.expired?
      redirect_to new_password_reset_url, alert: "Password reset has expired."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, notice: "Password has been reset!"
    else
      render :edit
    end
  end
end
