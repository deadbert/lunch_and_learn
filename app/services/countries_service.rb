class CountriesService

  def conn
    Faraday.new(url: "https://restcountries.com/v3.1/")
  end

  def get_url(endpoint)
    response = conn.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)
  end

  def random_country
    get_url("all")
  end

  def country(country)
    get_url("name/#{country}")
  end
end