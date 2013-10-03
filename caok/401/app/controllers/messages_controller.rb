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
    start = Time.zone.now
    10.times do
      Message.uncached do
        Message.where('created_at > ?', start).each do |message|
          response.stream.write "data: #{message.to_json}\n\n"
          start = message.created_at
        end
      end
      sleep 2
    end
  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close
  end
end
