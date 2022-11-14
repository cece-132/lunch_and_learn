class Api::V1::TouristSightsController < ApplicationController
  def index
    sights_array = PlacesFacade.find_sights(params[:country])
    render json: TouristSightsSerializer.sights(sights_array), status: 200
  end
end

