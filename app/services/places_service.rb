class PlacesService


  private

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://api.geoapify.com/v2") do |faraday|
      faraday.params["apiKey"] = ENV['apiKey']
    end
  end
end