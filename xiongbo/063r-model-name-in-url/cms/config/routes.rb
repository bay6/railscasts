Cms::Application.routes.draw do
  root to: 'pages#index'
  resources :pages, only: [:index, :new, :create]
  resources :pages, path: "", except: [:index, :new, :create]
end
