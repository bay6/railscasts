class UsersController < ApplicationController
  def new
    @signup_form = SignupForm.new
  end

  def create
    @signup_form = SignupForm.new
    if @signup_form.submit(params_signup_form)
      session[:user_id] = @signup_form.user.id
      redirect_to @signup_form.user, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
    @user = current_user
  end

  private

  def params_signup_form
    params.require(:signup_form).permit(:username, :email, :password, :password_confirmation,
                                        :twitter_name, :github_name, :bio, :subscribed)
  end
end
