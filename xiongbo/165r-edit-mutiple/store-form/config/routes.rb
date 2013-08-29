Store::Application.routes.draw do
  root to: 'products#index'
  resources :products do
    collection do
      get :edit_multiple
      put :update_multiple
    end
  end
end
