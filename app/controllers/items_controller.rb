class ItemsController < ApplicationController
  def create
    @item = Item.new(params.require(:item).permit(:product_id, :quantity))
    @item.save
    render :json => @item.to_json(:include => :product)
  end

  def index
    @items = Item.all
    render :json => @items.to_json(:include => :product)
  end

end
