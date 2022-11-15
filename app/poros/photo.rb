class Photo
  attr_reader :alt_tag,
              :url
  def initialize(data)
    @alt_tag = data[:tags]
    @url = build_url(data)
  end

  def build_url(data)
    if data[:url_o].nil?
      @url = "https://live.staticflickr.com/#{data[:server]}/#{data[:id]}_#{data[:secret]}.jpg"
    else
      data[:url_o]
    end
  end

end