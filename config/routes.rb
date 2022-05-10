Rails.application.routes.draw do
  get 'homes/top'
  get 'home/about' => "homes#about"
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:edit, :index, :create, :show, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    
    resources :book_comments, only: [:create, :destroy]
  end
end
