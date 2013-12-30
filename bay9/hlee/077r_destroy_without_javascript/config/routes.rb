Example::Application.routes.draw do
  resources :categories
  resources :products do
    member { get :delete }
  end
  root to: 'products#index'
end
