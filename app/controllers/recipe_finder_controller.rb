class RecipeFinderController < ApplicationController

  # Find all available recipe for one fridge_id
  def find
    @available_items = Item.where(:fridge_id => params[:fridgeId])

    @available_products = []
    @available_items.each do |item|
      @available_products.push(item.product)
    end

    find_recipe_for @available_products
  end

  # Find all available recipes for the given products
  def find_recipe_for(products)
    @recipes = Recipe.all
    @available_recipes = []

    @recipes.each do |recipe|
      possible = true

      recipe.recipes_items.each do |current_item|
        # Recipe not possible unless the needed product exists in the fridge
        possible = false unless products.include?(current_item.product)
      end

      if possible # This recipe is possible with the fridge content
        @available_recipes.push(recipe)
      end

    end

    # return detailed recipe to front's recommendation system
    render :json => @available_recipes.to_json(:include => {:recipes_items => {:include => :product}})
  end

end
