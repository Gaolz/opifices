Rails.application.routes.draw do

  namespace :console do
  post 'photo/upload',to: 'photos#create'
  root 'dashboard#index'
  resources :blogs,expect: :show
  resources :categories,expect: :show
  end

  root 'blogs#index'
  get 'category/:id' => 'blogs#category', :as => :category
  get 'blog/:slug.shtml' => 'blogs#show', :as => :blog
end