class PlacesService

  def self.places_service(country)
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