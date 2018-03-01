class RecipeItemController < ApplicationController

  def create
    @recipe_item = RecipesItems.new(params.require(:recipe_item).permit(:recipe_id, :product_id, :quantity))

    @recipe_item.save

    render :json => @recipe_item.to_json(:include => :product)
  end
end
