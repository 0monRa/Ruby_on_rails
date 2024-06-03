Rails.application.routes.draw do
  root "home#index"
  get 'home/index'

  get 'cat', to: 'cat#index'
  get 'cat/new', to: 'cat#new_cat'
  post 'cat', to: 'cat#create'
  get 'cat/:id', to: 'cat#show'
  get 'cat/:id/edit', to: 'cat#edit'
  patch 'cat/:id', to: 'cat#update'
  put 'cat/:id', to: 'cat#update'
  delete 'cat/:id', to: 'cat#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

end
