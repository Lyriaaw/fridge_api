class ReceipeItemController < ApplicationController

  def create
    @receipe_item = ReceipeItem.new(params.require(:receipe_item).permit(:receipe_id, :product_id))
    @receipe_item.save

    render :json => @receipe_item.to_json(:include => :product)
  end
end
