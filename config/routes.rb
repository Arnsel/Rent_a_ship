Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  devise_for :users
  root to: "ships#index"

  resources :ships, except: :index do
    resources :bookings
  end
end
