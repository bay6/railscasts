Store::Application.routes.draw do
  get "about", to: "info#about"

  get "info/privacy"

  get "info/license"

  resources :products
  root to: 'products#index'
end
