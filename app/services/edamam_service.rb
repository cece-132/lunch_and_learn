class EdamamService

  def self.search_countries(country)
    response = conn.get("recipes/v2?cuisineType=#{country}")
    binding.pry
    parse(response.body)
  end
  
  private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://api.edamam.com/api/?type=public") do |faraday|
      faraday.params["type"] = ENV["type"]
      faraday.params["app_id"] = ENV['app_id']
      faraday.params["app_key"] = ENV['app_key']
    end
  end
end