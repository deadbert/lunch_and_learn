class CountriesFacade
  def initialize()
    @service = CountriesService.new()
  end

  def random_country
    countries = @service.random_country
    country_names = countries.map { |country| country[:name][:common]}
    country_names.sample()
  end
end