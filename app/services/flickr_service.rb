class FlickrService

  def self.photo_data(country)
    response = conn.get("/services/rest/?") do |req|
      req.params['method'] = 'flickr.photos.search'
      req.params['text'] = country
      req.params['per_page'] = 10
      req.params['extras'] = 'tags,url_o'
    end
    xml_to_json = Hash.from_xml(response.body).to_json
    parse(xml_to_json)
  end
  
  private

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://www.flickr.com") do |faraday|
      faraday.params["api_key"] = ENV['flickr_key']
    end
  end

end