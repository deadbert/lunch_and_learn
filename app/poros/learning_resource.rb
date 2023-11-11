class LearningResource
  attr_reader :id, :country, :video, :images
  def initialize(video, images)
    @id = nil
    @country = nil
    @video = make_video(video)
    @images = make_images(images)
  end

  def make_images(images)
    images.map do |image|
      { alt_tag: image[:alt_description], url: image[:urls][:small]}
    end
  end

  def make_video(video)
    if !video.nil?
      {title: video[:snippet][:title], youtube_video_id: video[:id][:videoId]}
    else
      {}
    end
  end

  def set_search_term(search_term)
    @country = search_term
  end
end