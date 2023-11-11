class LearningResource

  def initialize(video, images)
    @country = nil
    @video = {title: video[:snippet][:title], youtube_video_id: video[:id][:videoId]}
    @images = make_images(images)
    require 'pry';binding.pry
  end

  def make_images(images)
    images.map do |image|
      { alt_tag: image[:alt_description], url: image[:urls][:small]}
    end
  end
end