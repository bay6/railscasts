class UsersController < ApplicationController
  def new
    @signup_form = SignupForm.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
    @user = current_user
  end

private

  def user_params
    params.require(:user).permit(
      :username, :email, :password, :password_confirmation, :subscribed,
      profile_attributes: [:twitter_name, :github_name, :bio]
    )
  end
end
