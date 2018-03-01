class RecipesController < ApplicationController

  # Persist a recipe
  def create
    # Saving the recipe and then the items and steps
    @recipe = Recipe.new(params.require(:recipe).permit(:name, :description, :people))
    @steps = params[:steps]
    @items = params[:items]
    @recipe.save

    # Managing items saving
    @items.each do |item|
      @current_item = RecipesItems.new

      @current_item.recipe_id = @recipe.id
      @current_item.product_id = item[:product]
      @current_item.quantity = item[:quantity]

      @current_item.save
    end

    # Managing steps saving
    @steps.each do |step|
      @current_step = RecipesSteps.new

      @current_step.recipe_id = @recipe.id
      @current_step.description = step[:description]

      @current_step.save
    end


    render :json => @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
    render :json => @recipe.to_json(:include => [:recipes_steps, {:recipes_items => {:include => :product}}])
  end

  def index
    @recipes = Recipe.all
    render :json => @recipes
  end

end
