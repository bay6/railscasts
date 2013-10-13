class Permission < Struct.new(:user)
  def allow?(controller, action)
    controller == "topics" && action == "index"
  end
end
