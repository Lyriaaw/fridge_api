class ProductsController < ApplicationController

  def create
    @product = Product.new(params.require(:product).permit(:name, :description, :unit))
    @product.save
    render json: @product
  end

  def update
    @product = Product.find(params[:id])

    @product.update(name: params[:name])
    @product.update(description: params[:description])
    @product.update(unit: params[:unit])

    render :json => @product.to_json
  end

  def index
    @product = Product.all
    render json: @product
  end

  # Cascade destroy product
  def destroy
    @product = Product.find(params[:id])

    # Finding all the product fridge item and delete them
    @items = Item.where(:product_id => params[:id])
    @items.each do |item|
      item.delete
    end

    # Finding all the product recipe item and delete them
    @items = RecipesItems.where(:product_id => params[:id])
    @items.each do |item|
      item.delete
    end


    @product.delete
  end

end
