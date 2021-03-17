Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :elements
  end
  resources :users, only: :show
  resources :rooms
  resources :messages
end
