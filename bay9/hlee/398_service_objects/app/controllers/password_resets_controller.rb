class PasswordResetsController < ApplicationController
  def new
  end

  def create
    password_reset = PasswordReset.from_email(params[:email])
    #user = User.find_by_email(params[:email])
    #if user
    if password_reset.user
      #user.send_password_reset
      password_reset.send_email
      redirect_to root_url, notice: "Email sent with password reset instructions."
    else
      redirect_to new_password_reset_url, alert: "Email address does not match a user account."
    end
  end

  def edit
    #@user = User.find_by_password_reset_token!(params[:id])
    password_reset = PasswordReset.from_token(params[:id])
    @user = password_reset.user
  end

  def update
    #@user = User.find_by_password_reset_token!(params[:id])
    #if @user.password_reset_expired?
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
