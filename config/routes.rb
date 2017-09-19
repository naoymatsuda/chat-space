Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: [:index]
  resources :groups, only: [:create,:new, :edit, :update] do
    resources :chats, only: [:index, :create]
  end
end
