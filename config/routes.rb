Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

  resources :fridges
  resources :items
  resources :receipe
  resources :products

  get '/items/fridge/:fridge_id', to: 'items#item_from_fridge_id'
  get '/items/fridge/:fridge_id/obsolete', to: 'items#item_from_fridge_and_soon_obsolete'







end
