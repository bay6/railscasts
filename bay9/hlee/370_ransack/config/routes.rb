Store::Application.routes.draw do
  resources :products do
    collection { post :search, to: 'products#index' }
  end
  root to: 'products#index'
end
