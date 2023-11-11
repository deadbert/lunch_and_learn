class Api::V1::LearningResourcesController < ApplicationController

  def index
    resources = LearningResourcesFacade.new.learning_resources(params[:country])
  end
end