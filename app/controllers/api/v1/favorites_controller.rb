class Api::V1::FavoritesController < ApplicationController

  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: { success: "Favorite added successfully" }, status: 201
    else
      render json: { error: 'Unsuccessful Favorite Creation' }, status: 404
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:api_key, :country, :recipe_link, :recipe_title)
  end

end