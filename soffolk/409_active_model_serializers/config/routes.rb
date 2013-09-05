Blog::Application.routes.draw do
  root to: 'articles#index'
  resources :comments
  resources :articles
end
