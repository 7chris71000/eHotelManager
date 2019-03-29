Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => redirect("/users/sign_in")

  get "/filter" => "pages#filter"
  resources :rooms
  get "/success" => "rooms#success"
  resources :hotels

end
