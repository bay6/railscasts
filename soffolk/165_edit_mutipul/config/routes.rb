Store::Application.routes.draw do
  root to: 'products#index'
  resources :products do
    collection do
      get :edit_multipul
      put :update_multipul
    end
  end
end
