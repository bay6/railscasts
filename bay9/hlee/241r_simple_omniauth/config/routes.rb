Blog::Application.routes.draw do
  root :to => "articles#index"
  
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  
  resources :comments
  resources :articles
end
