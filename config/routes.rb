Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about' => 'homes#about', as: :"about"
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:edit, :index, :create, :show, :destroy, :update]
end
