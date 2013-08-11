Preunion::Application.routes.draw do
  resources :users

  resources :missions do
    resources :comments
  end

  post 'comment/preview', to: 'comments#preview', as: 'comment_preview'

  resources :teams do
    member do
      post :join, :quit
    end
  end

  delete 'session', to: 'session#destroy', as: :sign_out
  get '/auth/github/callback', to: 'session#auth'
  root to: 'home#index'

  post "/missions/:id/:action_name",
    :to => 'missions#perform_action',
    :as => :mission_perform_action

end
