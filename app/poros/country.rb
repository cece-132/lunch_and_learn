class Country
  attr_reader :name,
              :latlng,
              :place_id,
              :capital_name,
              :capital_long_lat

  def initialize(data)
    @name = data[:name][:common]
    @lnglat = Geocoder.search(data[:name][:official]).first.coordinates
    @capital_name = data[:capital].first
    @capital_long_lat = longitude_first(data[:capitalInfo][:latlng])
  end

  def longitude_first(coordinates)
    coordinates = [coordinates[1], coordinates[0]]
  end
end