class EdamamService

  def self.search_countries(country)
    response = conn.get('/search') do |req|
      req.params['q'] = country
      req.params['count'] = 10
    end
    parse(response.body)
  end
  
  private

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.edamam.com/v2") do |faraday|
      faraday.params["app_id"] = ENV['app_id']
      faraday.params["app_key"] = ENV['app_key']
    end
  end
end