Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => redirect("/users/sign_in")

  get "/filter" => "pages#filter"
  get "/settings" => "pages#settings"
  resources :rooms
  get "/success" => "rooms#success"
  get "/success_room" => "rooms#success_room"
  get "/error" => "rooms#error"
  resources :hotels
  get "/results" => "hotels#results"
  resources :hotel_chains
  resources :customers
  resources :employees

  get "/rooms/:id/checkout" => "rooms#checkout"
  get "/rooms/:id/checkoutForm" => "rooms#checkoutForm"

  resources :rooms do
  member do
    patch :checkoutForm
    put :checkoutForm
  end
end


end
