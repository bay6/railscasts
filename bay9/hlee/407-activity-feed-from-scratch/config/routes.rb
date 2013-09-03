Cookbook::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'recipes#index'

  resources :users
  resources :sessions
  resources :friendships
  resources :activities
  resources :recipes do
    resources :comments
  end
end
