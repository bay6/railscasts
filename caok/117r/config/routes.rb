Store::Application.routes.draw do
  resources :pages, except: :show
  get ':id', to: 'pages#show', as: :page


  #get "about", to: "info#about"

  #get "info/privacy"

  #get "info/license"

  %w[about privacy license].each do |page|
    get page, controller: "info", action: page
  end

  resources :products
  root to: 'products#index'
end
