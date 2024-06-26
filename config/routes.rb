Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'home/index'

  devise_scope :user do
    get 'signin', to: 'devise/sessions#new'
    post 'signin', to: 'devise/sessions#create'
    get 'logout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
    post 'signup', to: 'devise/registrations#create'
  end

  resources :cats do
    resources :breeds, only: [:new, :create]
  end

  resources :breeds, only: [:index, :new, :create, :edit, :update, :destroy]

  delete 'delete_cat/:id', to: 'cats#destroy', as: 'delete_cat'

  delete 'breeds/:id', to: 'breeds#destroy', as: 'delete_breed'


  delete 'cats/:id', to: 'cats#destroy', as: 'destroy_cat'

  get "up" => "rails/health#show", as: :rails_health_check
end
