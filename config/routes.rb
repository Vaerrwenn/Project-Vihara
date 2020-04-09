Rails.application.routes.draw do
  get 'members/index'
  get 'home/index'

  resources :deposits
  resources :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
