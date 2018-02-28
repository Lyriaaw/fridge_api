class ProductsController < ApplicationController

  def create
    @product = Product.new(params.require(:product).permit(:name, :description, :unit))
    @product.save
    render json: @product
  end

  def index
    @product = Product.all
    render json: @product
  end

end
