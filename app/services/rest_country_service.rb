
class RestCountryService

  def self.find_country
    response = conn.get("/v3.1/region/#{regions[rand(regions.length)]}")
    parse(response.body)
  end

  def self.search_country_by_name(country_name)
    response = conn.get("/v3.1/name/#{country_name}")
    parse(response.body)
  end

  private

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

  def self.regions
    ["Africa", "Americas", "Asia", "Europe", "Oceania"]
  end
  
end