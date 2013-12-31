Example::Application.routes.draw do
  resources :categories
  resources :products
  root to: 'products#index'
end
