Rails.application.routes.draw do
  devise_for :users
  root to: 'groups#index'
  resources :groups do
    get 'groups', to:'groups#edit'
  end
  resources :groups , only: [:new, :create, :edit]
end
