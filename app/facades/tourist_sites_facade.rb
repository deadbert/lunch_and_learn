class TouristSitesFacade

  def initialize()
    @countries_service = CountriesService.new()
    @places_service = PlacesService.new()
  end

  def find_sites(country)
    lat_long = @countries_service.country(country).first[:capitalInfo][:latlng]
    unless lat_long == nil
      tourist_sites = @places_service.find_tourist_sites(lat_long[1], lat_long[0])
      if tourist_sites[:features].empty?
        tourist_sites = nil
      else
        tourist_sites[:features].map do |site|
          TouristSite.new(site)
        end
      end
    end
  end
end