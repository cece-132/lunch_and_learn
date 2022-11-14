class Country
  attr_reader :name,
              :latlng,
              :place_id,
              :capital_name,
              :capital_long_lat
    attr_accessor :place_id

  def initialize(data)
    @name = data[:name][:common]
    @lnglat = Geocoder.search(data[:name][:official]).first.coordinates
    @capital_name = country_data.first[:capital].first
    @capital_long_lat = longitude_first(country_data.first[:capitalInfo])
    @place_id = nil
  end

  def longitude_first(coordinates)
    binding.pry
  end
end