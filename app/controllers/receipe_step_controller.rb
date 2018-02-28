class ReceipeStepController < ApplicationController

  def create
    @receipe_step = ReceipeStep.new(params.require(:receipe_step).permit(:receipe_id, :description))

    @receipe_step.save

    render :json => @receipe_step
  end


end
