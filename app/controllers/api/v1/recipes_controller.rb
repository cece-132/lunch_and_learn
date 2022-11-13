class Api::V1::RecipesController < ApplicationController

  def index
    recipes = RecipeFacade.search_countries(params[:country])
  end

end