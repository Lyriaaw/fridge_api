class ItemsController < ApplicationController
  def create
    @item = Item.new(params.require(:item).permit(:product_id, :quantity,  :limit_date, :fridge_id))
    @item.save
    # render json :@item.errors.full_message
    render :json => @item.to_json(:include => :product)
  end

  def index
    @items = Item.all
    render :json => @items.to_json(:include => :product)
  end

  def item_from_fridge_id
    @items = Item.where(:fridge_id => params[:fridge_id])

    render :json => @items.to_json(:include => :product)
  end

  def item_from_fridge_and_soon_obsolete
    @items = Item.where(:fridge_id => params[:fridge_id]).order(limit_date: :asc).limit(5)
    render :json => @items.to_json(:include => :product)
  end



  def change_multiple_items
    @items = params[:items]

    @items.each do |item|
      @current_item = Item.find(item[:id])
      @current_item.update(quantity: item[:quantity])

      # Item.update(@current_item)
    end

    render :json => @items.to_json

  end

end
