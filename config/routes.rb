Rails.application.routes.draw do
  get 'members/index'
  get 'home/index'

  resources :members do
    resources :deposits
    resources :withdraws
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
