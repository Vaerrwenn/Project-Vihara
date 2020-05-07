Rails.application.routes.draw do
  devise_scope :user do
    get "/register" => "users/registrations#new", as: "new_user_registration"
    get "/users/sign_up" => "users/registrations#new"
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

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
