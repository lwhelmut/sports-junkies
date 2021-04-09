Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :rooms
  resources :messages
  resources :users, only: :show
end
