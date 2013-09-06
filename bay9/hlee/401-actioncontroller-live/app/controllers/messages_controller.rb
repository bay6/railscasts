class MessagesController < ApplicationController
  include ActionController::Live

  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message].permit(:content, :name))
  end

  def events
    response.headers["Content-Type"] = "text/event-stream"
    3.times do |n|
      response.stream.write "data: #{n}...\n\n"
      sleep 2
    end
  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close
  end


end
