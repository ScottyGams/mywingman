MyWingman::Application.routes.draw do
 devise_for :users #, controllers: {omniauth_callbacks: 'omniauth_callbacks'} 

resources :users  
root to: "users#index"


end
