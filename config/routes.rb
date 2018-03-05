Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

  resources :fridges
  resources :items
  resources :recipes
  resources :products

  get '/items/fridge/:fridge_id', to: 'items#item_from_fridge_id'

  put '/items', to: 'items#change_multiple_items'


  get '/recipes/find/:fridgeId', to: 'recipe_finder#find'
  post '/recipe/:recipe_id/add-item', to: 'recipe_item#create'
  post '/recipe/:recipe_id/add-step', to: 'recipe_step#create'

  post '/dialog', to: 'dialog#intent'






end
