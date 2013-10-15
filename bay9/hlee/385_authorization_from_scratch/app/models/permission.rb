class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == "sessions"
    return true if controller == "users" && action.in?(%w[new create])
    return true if controller == "topics" && action.in?(%w[index show])
    if user
      return true if controller == "users" && action.in?(%w[edit update])
      return true if controller == "topics" && action != "destroy"
      return true if user.admin?
    end
    false
  end

  def initialize(user)
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    allow :topics, [:index, :show]
    if user
      allow :users, [:edit, :update]
      allow :topics, [:new, :create, :edit, :update]
      allow_all if user.admin?
    end
  end
end
