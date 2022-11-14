class PlacesService

  def self.find_sights(longitude, latitude)
    response = conn.get("/v2/places?filter=circle:#{longitude},#{latitude},20000&categories=tourism.sights")
    parse(response.body)
  end


  private

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.geoapify.com/v2") do |faraday|
      faraday.params["apiKey"] = ENV['apiKey']
    end
  end
end