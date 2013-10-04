Blog::Application.routes.draw do
  resources :articles
  root to: 'articles#index'
  match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement'
end
