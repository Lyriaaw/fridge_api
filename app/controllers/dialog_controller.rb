class DialogController < ApplicationController

  def intent
    @result = params[:result]
    @parameters = @result[:parameters]
    @metadata = @result[:metadata]

    @intent = @metadata[:intentName]


    case @intent
      when 'Default Welcome Intent - yes'
        find_recipe
      when 'What can i eat'
        find_recipe
      when 'AddItem'
        add_item @parameters
      when 'See recipe'
        see_recipe @parameters
    end



    # render :json => {:speech => "Tu demande l'intent " + @intent}
  end

  def see_recipe parameters


    @recipe = Recipe.find_by_name(parameters[:Recipe])

    if @recipe.blank?
      @text = "La recette n'existe pas"
    else
      @text = "Voici la recette des " + @recipe.name + " pour " + @recipe.people.to_s + " personnes."


      @text = @text + "Il vous faut : "
      @recipe.recipes_items.each do |item|
        @text = @text + item.quantity.to_s + " " + item.product.unit + " de " + item.product.name + ","
      end

      @text = @text + ". "

      @text = @text + "Pour la préparation : "
      @recipe.recipes_steps.each do |step|
        @text = @text + step.description + "."
      end
    end



    render :json => {:speech => @text  }
  end

  def add_item parameters





    render :json => {:speech => "L'ajout de " + parameters[:Item] + " par la voix n'est pas encore accessible"}
  end




  def find_recipe
    @available_items = Item.where(:fridge_id => 1)

    @available_products = []
    @available_items.each do |item|
      @available_products.push(item.product)
    end

    @recipes = Recipe.find_for_products @available_products


    @text = "Je peux vous conseiller les recettes suivantes : "
    @recipes.each do |recipe|
      @text = @text + recipe.name + ","
    end

    @text = @text + ". Une recette vous tente ?"

    render :json => {:speech => @text}
  end




end
