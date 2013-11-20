Store::Application.routes.draw do
  #resources :pages
  #get "info/about"
  #get 'about', to: 'info#about'
  #get "info/privacy"
  #get "info/license"
  #%w[about privacy license].each do |page|
    #get page, controller: 'info', action: page
  #end

  resources :pages, except: :show
  resources :products
  root to: 'products#index'
  get ':id', to: 'pages#show', as: :page
end
