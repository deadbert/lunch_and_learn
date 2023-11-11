class Api::V1::LearningResourcesController < ApplicationController

  def index
    resources = LearningResourcesFacade.new.learning_resources(params[:country])
    resources.set_search_term(request.params[:country])
    render json: LearningResourceSerializer.new(resources)
  end
end