Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new, :create, :destroy, :show]
  root 'events#index'
end
