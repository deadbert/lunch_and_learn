class VideoService 

  def conn
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/") do |f|
      f.params[:key] = Rails.application.credentials[:google][:youtube_key]
      f.params[:part] = "snippet"
      f.params[:channelId] = "UCluQ5yInbeAkkeCndNnUhpw"
    end
  end

  def get_url(endpoint)
    response = conn.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)
  end

  def video_search(q)
    get_url("search?q=#{q}")
  end
end