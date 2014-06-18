MyWingman::Application.routes.draw do
  resources :likes


 devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks', :registrations => "registrations"} 

resources :users
resources :friendships  
root to: "users#index"

end
