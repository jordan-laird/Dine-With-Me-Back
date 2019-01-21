Rails.application.routes.draw do
  warp_resources :meals 
  warp_resources :invites
  warp_resources :users
  warp_resources :auth
  warp_resources :restaurants
  warp_resources :messages


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
