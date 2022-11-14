class TouristSightsSerializer

  def self.sights(sights)
    { data: 
      sights.map do |sight|
       { id: nil,
        type: sight.class.to_s.downcase,
          attributes: {
            name: sight.name,
            address: sight.address,
            place_id: sight.place_id
          }
        }
      end
    }
  end
end