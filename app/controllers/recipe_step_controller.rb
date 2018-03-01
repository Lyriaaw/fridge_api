class RecipeStepController < ApplicationController

  def create
    @recipe_step = RecipeStep.new(params.require(:recipe_step).permit(:recipe_id, :description))

    @recipe_step.save

    render :json => @recipe_step
  end


end
