class Api::V1::LearningResourcesController < ApplicationController

  def index
    learning_resources_objects = LearningResourcesFacade.acquire_resources(params[:country])
    binding.pry
    render json: LearningResourcesSerializer.format_resources(learning_resources_objects)
  end

end