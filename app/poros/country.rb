class Country
  attr_reader :name,
              :latlng

  def initialize(data)
    @name = data[:name][:common]
    @latlng = Geocoder.search(data[:name][:official]).first.coordinates
  end
end