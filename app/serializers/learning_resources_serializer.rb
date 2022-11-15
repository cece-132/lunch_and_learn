class LearningResourcesSerializer

  def self.format_resources(video, photos_array, country)
    {
      data: {
        id: nil,
        type: "learning resource",
        attributes: {
          country: country,
          video: {
            title: video.title,
            youtube_video_id: video.youtube_video_id
          },
          images: photos_array.map do |photo|
            { alt_tag: photo.alt_tag,
              url: photo.url
            }
          end
        }
      }
    }
  end

end