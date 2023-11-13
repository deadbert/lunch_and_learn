class TouristSitesFacade

  def initialize()
    @coutries_service = CountriesService.new()
    @places_service = PlacesService.new()
  end
end