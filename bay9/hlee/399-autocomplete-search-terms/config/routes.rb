Store::Application.routes.draw do
  resources :search_suggestions


  resources :products
  root to: 'products#index'
end
