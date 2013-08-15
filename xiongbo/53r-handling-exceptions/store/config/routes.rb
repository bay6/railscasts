Store::Application.routes.draw do
  resources :products
  root to: 'products#index'

  match ':status', to: 'errors#show', constraints: {status: /\d{3}/}
end
