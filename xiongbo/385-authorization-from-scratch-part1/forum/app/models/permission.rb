class Permission < Struct.new(:user)
  def allow?(controller, action)
    if user.nil?
      controller == "topics" && action.in? %w(index, show)
    elseif user.admin?
      true
    else
      controller == "topics" && action != "destroy"
    end
  end
end
