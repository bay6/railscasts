Store::Application.routes.draw do
  resources :products
  root to: 'products#index'
  match '404', to: redirect('/')
end
