class MessagesController < ApplicationController
  include ActionController::Live
  def index
    @messages = Message.all
  end

  def create
    response.headers["Content-Type"] = "text/javascript"
    @message = Message.create!(params[:message].permit(:content, :name))
    $redis.publish('messages.create', @message.to_json)
  end

  def events
    response.headers["Content-Type"] = "text/event-stream"
    redis = Redis.new
    redis.subscribe('messages.*') do |on|
      on.pmessage do |pattern, event, data|
        response.stream.write("event: #{event}\n")
        response.stream.write("data: #{data}\n\n")
      end
    end
  rescue IOError
    logger.info "Stream closed"
  ensure
    redis.quit
    response.stream.close
  end
end
