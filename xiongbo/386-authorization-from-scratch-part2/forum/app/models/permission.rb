class Permission

  def initialize user
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    allow :topics, [:index, :show]

    if user
      allow :users, [:edit, :update]
      allow :topics, [:new, :create, :edit, :update]
      allow_all if user.admin?
    end
  end

  def allow controllers, actions 
    @allow_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = true
      end
    end
  end

  def allow_all
    @allow_all = true
  end

  def allow?(controller, action)
    @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
  end 

end
