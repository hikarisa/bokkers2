Rails.application.routes.draw do
  get 'homes/top'
  get 'home/about' => "homes#about"
  devise_for :users
  devise_scope :users do
    get 'signup' => 'devise/registrations#new'
    post 'login' => 'devise/sessions#create'
    get 'logout' => 'devise/sessions#destroy'
  end
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:edit, :index, :create, :show, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]

    resources :book_comments, only: [:create, :destroy]
  end
end
