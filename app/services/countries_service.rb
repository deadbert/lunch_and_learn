class CountriesService

  def conn
    Faraday.new(url: "https://restcountries.com/v3.1/")
  end

  def get_url(endpoint)
    conn.get(enpoint)
  end

  def search_countries(q)
    get_url("name/#{q}")
  end
end