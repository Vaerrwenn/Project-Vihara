Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :members do
    resources :transactions
  end

  resources :homes do
    resources :members
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
