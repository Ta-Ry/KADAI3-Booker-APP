Rails.application.routes.draw do
  root to: 'toppage#index'
  get "home/about" => "about#index"
  get "/users" => "users#index"
  get 'users/follow_list/:user_id' => 'users#follow_list', as: 'follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list', as: 'follower_list'
  get 'search/search' => 'search#search', as: 'search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:update, :edit, :show, :index, :create, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:update, :edit, :show, :index, :ensure_correct_user]
  resources :relationships, only: [:create, :destroy]
end