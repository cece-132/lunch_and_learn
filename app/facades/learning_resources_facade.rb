class LearningResourcesFacade

  def self.acquire_resources(country)
    video_data = YoutubeService.video_data(country)
    video_object = Video.new(video_data)
    
  end

end