class RestCountryService

  def self.find_american_country
    response = conn.get("/v3.1/region/#{regions[rand(regions).length]}")
    binding.pry
    parse(response.body)
  end

  private

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end
  
end