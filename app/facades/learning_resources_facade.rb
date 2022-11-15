class LearningResourcesFacade

  def acquire_resources(country)
    video_data = YoutubeService.video_data(country)
    
  end

end