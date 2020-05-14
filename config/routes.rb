Rails.application.routes.draw do
  devise_scope :user do
    get "/register" => "users/registrations#new", as: "new_user_registration"
    get "/users/sign_up" => "users/registrations#new"
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

  # concern :with_datatable do
  #   post 'datatable', on: :collection
  # end

  resources :members do
    resources :transactions
    post 'datatable', on: :collection
  end

  resources :home do
    resources :members
    post 'datatable', on: :collection
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
