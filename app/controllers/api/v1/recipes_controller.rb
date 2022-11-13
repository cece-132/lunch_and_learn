class Api::V1::RecipesController < ApplicationController

  def index
    recipes = RecipeFacade.search_countries(params[:country])
    render json: RecipeSerializer.format_recipes(recipes)
  end

end