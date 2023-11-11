class ImageService

  def conn
    Faraday.new(url: "https://api.unsplash.com/") do |f|
      f.params[:client_id] = Rails.application.credentials.unsplash[:key]
    end
  end

  def get_url(endpoint)
    response = conn.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)
  end

  def image_search(q)
    get_url("search/photos?query=#{q}")
  end
end