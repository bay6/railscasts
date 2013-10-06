Store::Application.routes.draw do
  resources :search_suggustions


  resources :products
  root to: 'products#index'
end
