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

  def find_tourist_sites(long, lat)
    get_url("places?filter=circle:#{long},#{lat},1000&categories=tourism.sights")
  end
end