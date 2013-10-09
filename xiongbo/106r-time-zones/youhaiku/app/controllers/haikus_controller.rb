class HaikusController < ApplicationController
  before_filter :authorize, except: :index

  def index
    @haikus = Haiku.order("published_at desc")
  end

  def create
    @haiku = current_user.haikus.create!(params[:haiku])
    redirect_to root_url, notice: "Successfully created haiku."
  end

private

  def authorize
    redirect_to login_url, alert: "You must first log in." if current_user.nil?
  end
end
