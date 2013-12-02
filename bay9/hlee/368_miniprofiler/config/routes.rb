Example::Application.routes.draw do
  resources :projects do
    resources :tasks
  end
  root to: 'projects#index'
end
