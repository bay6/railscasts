class UsersController < ApplicationController
  def new
    @signup_form = SignupForm.new
  end

  def create
    @signup_form = SignupForm.new
    if @signup_form.submit(params[:user])
      session[:user_id] = @signup_form.user.id
      redirect_to @signup_form.user, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
    @user = current_user
  end
end
