class MessagesController < ApplicationController
  include ActionController::Live
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message].permit(:content, :name))
  end

  def events
    3.times do |n|
      response.stream.write "#{n}..\n\n"
      sleep 2
    end
  ensure
    response.stream.close
  end
end
