class EdamamService

  def self.search_countries(country)
    response = conn.get("/search/")
    "/recipes/v2?type=public&app_id=be38002a&app_key=9bff66efd5d2b993eec5f3e18e491c31&cuisineType=French"
  end
  
  private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("http://api.edamam.com/api/")
  end
end