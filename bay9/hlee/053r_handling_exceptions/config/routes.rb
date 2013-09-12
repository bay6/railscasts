Store::Application.routes.draw do
  resources :products
  root to: 'products#index'
  #get '404', to: redirect('/')
  #get ':status', to: 'errors#show', constraints: { status: /\d{3}/ }
  get '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/}
end
