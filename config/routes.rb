Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :places, only: [ :index, :create, :edit, :show, :update, :new ]
  resources :bookings, only: [ :index, :create, :edit, :show, :update, :new ]
  get "/bookings/:id/accept", to: "bookings#accept", as: :accept_booking
  get "/bookings/:id/decline", to: "bookings#decline", as: :decline_booking


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
