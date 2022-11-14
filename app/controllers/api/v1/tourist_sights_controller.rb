class Api::V1::TouristSightsController < ApplicationController
  def index
    country_data = PlacesFacade.find_sights(params[:country])
  end
end

