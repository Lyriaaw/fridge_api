class RecipeFinderController < ApplicationController

  def find

    @available_items = Item.where(:fridge_id => params[:fridgeId])


    @available_products = []

    @available_items.each do |item|
      @available_products.push(item.product)
    end

    find_recipe_for @available_products
  end

  def find_recipe_for(products)

    @recipes = Recipe.all

    @available_recipes = []

    @recipes.each do |recipe|
      possible = true

      recipe.recipes_items.each do |current_item|
        possible = false unless products.include?(current_item.product)
      end

      if possible
        @available_recipes.push(recipe)
      end

    end

    render :json => @available_recipes.to_json(:include => {:recipes_items => {:include => :product}})
  end

end
