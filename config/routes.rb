Rails.application.routes.draw do
  root 'buses#index'

  devise_for :users
  resources :buses do
    post :buy_ticket, on: :member
  end

  resources :users, only: :show
end
