Cms::Application.routes.draw do
  resources :pages, path: "", except: [:index, :new, :create]
  resources :pages, only: [:index, :new, :create]
  root to: 'pages#index'
  get "*id", to: 'pages#show'
end
