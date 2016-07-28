Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
resources :about, only: [:index]
resources :home, only: [:index]
resources :admin, only: [:index]
resources :meetus, only: [:index]
  resources :events do
      resources :guestlists, only: [:new, :create, :destroy, :index, :show]
    end
end
