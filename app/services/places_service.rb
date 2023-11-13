class PlacesService

  def conn
    Faraday.new(url: "https://api.geoapify.com/v2/") do |f|
      f.params[:apiKey] = Rails.application.credentials.places[:key]
    end
  end

  def get_url(endpoint)
    result = conn.get(endpoint)
    JSON.parse(result.body, symbolize_names: true)
  end

  def test
    get_url("places?categories=commercial.supermarket&filter=rect%3A10.716463143326969%2C48.755151258420966%2C10.835314015356737%2C48.680903341613316&limit=20")
  end
end