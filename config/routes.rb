Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :craftmen

  get '/dashboard', to: 'users#dashboard'
  get '/edit-profile', to: 'users#edit'
  patch  '/edit-profile', to: 'users#update'
  delete '/edit-profile', to: 'users#destroy'

  get '/craftmen/dashboard', to: 'craftmen#dashboard'
  get '/craftmen/edit-profile', to: 'craftmen#edit'
  patch  '/craftmen/edit-profile', to: 'craftmen#update'
  delete '/craftmen/edit-profile', to: 'craftmen#destroy'

  resources :universes, only: %i(show) do
    resources :workshops, only: %i(index)
  end

  resources :workshops, only: %i(show new create edit update destroy) do
    get '/users/:user_id/messages/new', to: 'messages#new_craftman', as: :new_user_message
    post '/users/:user_id/messages/create', to: 'messages#create_craftman', as: :create_user_message
    get '/users/:user_id/messages', to: 'messages#index_craftman', as: :user_messages

    post '/messages/create', to: 'messages#create_first', as: :create_first_message

    post '/users/:user_id/bookings/create', to: 'bookings#create', as: :create_user_booking
    resources :messages, only: %i(new create)
  end

  resources :bookings, only: %i(index show edit destroy)
  patch  '/bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch  '/bookings/:id/reject', to: 'bookings#reject', as: :reject_booking
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
