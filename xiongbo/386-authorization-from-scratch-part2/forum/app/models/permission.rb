class Permission

  def initialize user
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    allow :topics, [:index, :show]

    if user
      allow :users, [:edit, :update]
      allow :topics, [:new, :create]
      allow :topics, [:edit, :update] do |topic|
        topic.user_id == user.id
      end
      allow_param :topic, :name
      allow_all if user.admin?
    end
  end

  def allow controllers, actions, &block 
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

  def allow_param resources, attributes 
    @allowed_params ||= {}
    Array(resources).each do |resource|
      @allowed_params[resource.to_s] ||= []
      @allowed_params[resource.to_s] += Array(attributes).map(&:to_s)
    end
  end

  def allow_all
    @allow_all = true
  end

  def allow? controller, action, resource = nil
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end 

  def allow_param? resource, attribute
    if @allow_all
      true
    elsif @allowed_params && @allowed_params[resource.to_s]
      @allowed_params[resource.to_s].include? attribute.to_s
    end
  end
end
