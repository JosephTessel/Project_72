Rails.application.routes.draw do
  root 'events#index'
  devise_for :users

  resources :events do
      resources :guestlists, only: [:new, :create, :destroy, :index, :show]
    end
end
