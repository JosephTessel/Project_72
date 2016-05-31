Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
resources :about, only: [:index]
  resources :events do
      resources :guestlists, only: [:new, :create, :destroy, :index, :show]
    end
end
