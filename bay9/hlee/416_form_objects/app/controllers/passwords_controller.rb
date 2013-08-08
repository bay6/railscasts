class PasswordsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @user = current_user
    @user.changing_password = true
    if @user.update_attributes(password_params)
      redirect_to current_user, notice: "Successfully changed password."
    else
      render "new"
    end
  end

private

  def password_params
    params.require(:user).permit(:original_password, :new_password, :new_password_confirmation)
  end
end
