Blog::Application.routes.draw do
  resources :photos do
    resources :comments
  end

  resources :events do
    resources :comments
  end

  resources :articles do
    resources :comments
  end
  root to: 'articles#index'
end
