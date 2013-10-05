Checklist::Application.routes.draw do
  get 'signup', to: 'member_profiles#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :guest_profiles
  resources :member_profiles
  resources :sessions
  resources :tasks
  root to: 'tasks#index'
end
