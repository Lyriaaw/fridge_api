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

      puts "Searching in " + recipe.name

      recipe.recipes_items.each do |current_item|
        puts "Current item : " + current_item.product.name
        possible = false unless products.include?(current_item.product)
        puts "So : " + (possible ? "yes" : "no")
      end

      if possible
        @available_recipes.push(recipe)
      end

    end

    render :json => @available_recipes.to_json(:include => {:recipes_items => {:include => :product}})
  end

end
