Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new, :create, :destroy, :show]
  root 'events#index'

resources :users, :only => [:index, :show] do
  resources :follows, :only => [:create, :destroy]
end
end
