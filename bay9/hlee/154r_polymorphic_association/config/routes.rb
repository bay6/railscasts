Blog::Application.routes.draw do
  get "comments/index"

  get "comments/new"

  resources :photos
  resources :events
  resources :articles
  root to: 'articles#index'
end
