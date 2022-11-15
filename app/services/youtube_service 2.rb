class YoutubeService

  def self.video_data(country)
    response = conn.get("/youtube/v3/search") do |req|
      req.params['part'] = 'snippet'
      req.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      req.params['maxResults'] = 1
      req.params['q'] = country
    end
    parse(response.body)
  end
  
  private

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://youtube.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['key']
    end
  end

end