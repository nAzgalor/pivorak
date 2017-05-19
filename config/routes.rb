Rails.application.routes.draw do
  root 'buses#index'

  devise_for :users
  resources :buses do
    post :buy_ticket, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
