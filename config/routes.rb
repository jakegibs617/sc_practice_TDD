Rails.application.routes.draw do
  root 'manufacturers#index'
  devise_for :users

  resources :manufacturers, only: [:index, :new, :create]
  resources :cell_phones, only: [:index, :new, :create]
end
