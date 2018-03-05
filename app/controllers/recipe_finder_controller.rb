class RecipeFinderController < ApplicationController

  # Find all available recipe for one fridge_id
  def find
    @available_items = Item.where(:fridge_id => params[:fridgeId])

    @available_products = []
    @available_items.each do |item|
      @available_products.push(item.product)
    end

    @recipes = Recipe.find_for_products @available_products

    render :json => @recipes.to_json(:include => {:recipes_items => {:include => :product}})

  end


end
