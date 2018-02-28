class ReceipesController < ApplicationController

  def create
    @receipe = Receipe.new(params.require(:receipe).permit(:name, :description, :people))

    @receipe.save

    render :json => @receipe
    #
    # # params[:receipe_items].each do |item|
    # #   render json :item
    # # end
    #
    # render json :params[:receipe_items]



    # render :json => @receipe.to_json(:include => [:receipe_steps, :receipe_items])


  end

  def show
    @receipe = Receipe.find(params[:id])

    render :json => @receipe.to_json(:include => [:receipe_steps, {:receipe_items => {:include => :product}}])
  end

  def index
    @receipes = Receipe.all

    render :json => @receipes
  end

end
