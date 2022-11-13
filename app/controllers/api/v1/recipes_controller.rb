class Api::V1::RecipesController < ApplicationController

  def index
    recipes = RecipeFacade.search_countries(params[:country])
    render json: RecipeSerializer.new(recipes)
  end

end