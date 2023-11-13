class Api::V1::TouristSitesController < ApplicationController

  def index
    tourist_sites = TouristSitesFacade.new.find_sites(params[:country])
    if tourist_sites
      render json: TouristSiteSerializer.new(tourist_sites)
    else
      render json: ErrorSerializer.new(Error.new("No results found for search"))
    end
  end
end