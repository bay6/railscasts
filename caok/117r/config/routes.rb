Store::Application.routes.draw do
  get "about/privacy"

  get "about/license"

  resources :products
  root to: 'products#index'
end
