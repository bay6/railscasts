class Permission < Struct.new(:user)
  def allow?(controller, action)
    controller == "topics" && action.in?(%w[index show])
  end
end
