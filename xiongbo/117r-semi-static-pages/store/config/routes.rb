Store::Application.routes.draw do
  resources :pages, except: :show 
  resources :products
  root to: 'products#index'
  get ":page_name", to: 'pages#show', as: :page
end
