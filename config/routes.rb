Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  devise_for :craftmen

  get '/dashboard', to: 'users#dashboard'
  get '/edit-profile', to: 'users#edit'
  patch  '/edit-profile', to: 'users#update'
  delete '/edit-profile', to: 'users#destroy'

  get '/dashboard', to: 'craftmen#dashboard'
  get '/edit-profile', to: 'craftmen#edit'
  patch  '/edit-profile', to: 'craftmen#update'
  delete '/edit-profile', to: 'craftmen#destroy'

  resources :universes, only: %i(show) do
    resources :workshops, only: %i(index)
  end

  resources :workshops, only: %i(show new create edit update destroy) do
    resources :messages, only: %i(index new create)
  end

  resources :bookings, only: %i(show new create destroy)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
