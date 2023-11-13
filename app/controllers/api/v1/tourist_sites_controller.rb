class Api::V1::TouristSitesController < ApplicationController

  def index
    tourist_sites = TouristSitesFacade.new.find_sites(params[:country])
    require 'pry';binding.pry
  end
end