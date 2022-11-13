class Api::V1::RecipesController < ApplicationController

  def index
    if params[:country].nil?
      country = CountryFacade.random_country
      recipes = RecipeFacade.search_countries(country)
        if recipes.empty?
          render json: { data: [] }
        else
          render json: RecipeSerializer.format_recipes(recipes)
        end
    else
      recipes = RecipeFacade.search_countries(params[:country])
      render json: RecipeSerializer.format_recipes(recipes)
    end
  end

end