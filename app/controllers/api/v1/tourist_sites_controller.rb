class Api::V1::TouristSitesController < ApplicationController

  def index
    tourist_sites = TouristSitesFacade.new.find_sites(params[:country])
    render json: TouristSiteSerializer.new(tourist_sites)
  end
end