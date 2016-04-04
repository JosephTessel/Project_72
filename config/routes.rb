Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new, :create, :destroy, :show]
  root 'events#index'
  resources :events do
      resources :guestlists, only: [:index, :show, :new, :create, :destroy]
    end
end
