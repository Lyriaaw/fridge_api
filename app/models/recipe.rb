class Recipe < ApplicationRecord
  has_many :recipes_items, :class_name => "RecipesItems", :foreign_key => "recipe_id"
  has_many :recipes_steps, :class_name => "RecipesSteps", :foreign_key => "recipe_id"

  # Find all available recipes for the given products
  def self.find_for_products(products)
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

    @available_recipes
  end


end
