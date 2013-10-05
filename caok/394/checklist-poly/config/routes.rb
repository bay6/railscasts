Checklist::Application.routes.draw do
  get 'signup', to: 'members#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :guests
  resources :members
  resources :sessions
  resources :tasks
  root to: 'tasks#index'
end
