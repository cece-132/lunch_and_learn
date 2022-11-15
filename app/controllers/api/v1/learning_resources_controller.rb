class Api::V1::LearningResourcesController < ApplicationController

  def index
    learning_resources = LearningResourcesFacade.acquire_resources(params[:country])
    render json: LearningResourcesSerializer.format_resources(learning_resources[0], learning_resources[1], params[:country])
  end

end