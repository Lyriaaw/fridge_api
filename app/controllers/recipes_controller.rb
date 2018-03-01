class RecipesController < ApplicationController

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:name, :description, :people))

    @steps = params[:steps]
    @items = params[:items]

    @recipe.save

    @items.each do |item|
      # render :json => item[:product]
      @current_item = RecipesItems.new

      @current_item.recipe_id = @recipe.id
      @current_item.product_id = item[:product]
      @current_item.quantity = item[:quantity]

      @current_item.save
    end

    @steps.each do |step|
      # render :json => item[:product]
      @current_step = RecipesSteps.new

      @current_step.recipe_id = @recipe.id
      @current_step.description = step[:description]

      @current_step.save
    end


    # @steps.each do |step|
    #   step[:recipe_id] = @recipe.id
    #   step.save
    # end


    render :json => @recipe.id

    #.to_json(:include => [:recipes_steps, {:recipes_items => {:include => :product}}])

    #
    # # params[:recipe_items].each do |item|
    # #   render json :item
    # # end
    #
    # render json :params[:recipe_items]



    # render :json => @recipe.to_json(:include => [:recipe_steps, :recipe_items])


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
