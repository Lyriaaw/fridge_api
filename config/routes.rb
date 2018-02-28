Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

  resources :fridges
  resources :items
  resources :receipes
  resources :receipe_item
  resources :receipe_step
  resources :products

  get '/items/fridge/:fridge_id', to: 'items#item_from_fridge_id'
  get '/items/fridge/:fridge_id/obsolete', to: 'items#item_from_fridge_and_soon_obsolete'

  post '/recipe/:recipe_id/add-item', to: 'receipe_item#create'
  post '/recipe/:recipe_id/add-step', to: 'receipe_step#create'






end
