class LearningResourcesFacade
  
  def initialize()
    @video_service = VideoService.new()
    @image_service = ImageService.new()
  end

  def learning_resources(q)
    video = @video_service.video_search(q)[:items]&.first
    images = @image_service.image_search(q)[:results]
    LearningResource.new(video, images)
  end
end