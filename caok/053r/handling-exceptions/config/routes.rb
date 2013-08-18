Store::Application.routes.draw do
  resources :products
  root to: 'products#index'
  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/} # via: :all
end
