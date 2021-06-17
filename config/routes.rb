Rails.application.routes.draw do
  get 'welcome/index'

  # resource :articles
  get 'articles', to: 'articles#index'
  get 'articles/show', to: 'articles#show'
  get 'articles/new', to: 'articles#new'
  post 'articles', to: 'articles#create'
  patch 'articles/edit', to: 'articles#edit'
  get 'articles/edit', to: 'articles#edit'
  post 'articles/update', to: 'articles#update'
  delete 'articles/destroy', to: 'articles#destroy'
  root 'welcome#index'
  # resources :articles do
  #   resources :comments
  # end
  post 'articles/:article_id/comments', to: 'comments#create', as: 'article_comments'
  delete '/articles/:article_id/comments/:id', to: 'comments#destroy', as: 'article_comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
