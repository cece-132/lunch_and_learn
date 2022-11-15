class LearningResourcesFacade

  def self.acquire_resources(country)
    video = video_object(country)
    photos = photos_array(country)
    resources = [video, photos]
  end

  def self.video_object(country)
    video_data = YoutubeService.video_data(country)
    video_object = Video.new(video_data)
  end

  def self.photos_array(country)
    ten_photos_data = FlickrService.photo_data(country)[:rsp][:photos][:photo]
    ten_photos_data.map do |photo_data|
      Photo.new(photo_data)
    end
  end

end