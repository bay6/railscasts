Projects::Application.routes.draw do
  resources :projects
  resources :tasks
  root to: 'projects#index'
end
