Example::Application.routes.draw do
  resources :projects do
    resources :tasks
  end
  match 'sleep', to: 'sleep#index'
  root to: 'projects#index'
end
