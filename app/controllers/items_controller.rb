class ItemsController < ApplicationController
  def create
    @item = Item.new(params.require(:item).permit(:product_id, :quantity,  :limit_date, :fridge_id))
    @item.save
    render :json => @item.to_json(:include => :product)
  end

  def index
    @items = Item.all
    render :json => @items.to_json(:include => :product)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    render :json => @item.to_json
  end

  # find items depending on the firdge_id
  def item_from_fridge_id
    @items = Item.where(:fridge_id => params[:fridge_id])
    render :json => @items.to_json(:include => :product)
  end


  # Update quantity on multiple items
  def change_multiple_items
    @items = params[:items]

    @items.each do |item|
      @current_item = Item.find(item[:id])
      @current_item.update(quantity: item[:quantity])
    end

    render :json => @items.to_json
  end

end
