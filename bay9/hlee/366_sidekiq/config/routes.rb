Example::Application.routes.draw do
  require 'sidekiq/web'

  Example::Application.routes.draw do
    resources :snippets
    root to: "snippets#new"
    mount Sidekiq::Web, at: "/sidekiq"
  end
  resources :snippets
  root to: "snippets#new"
end
