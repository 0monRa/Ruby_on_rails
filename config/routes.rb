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

  resources :cats, except: :index

  get "up" => "rails/health#show", as: :rails_health_check

end
