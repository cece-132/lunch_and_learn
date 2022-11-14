class Sight
  attr_reader :name,
              :address,
              :place_id

  def initialize(data)
    @name = data[:properties][:name]
    @address = data[:properties][:address_line2]
    @place_id = data[:properties][:datasource][:place_id]
  end
end