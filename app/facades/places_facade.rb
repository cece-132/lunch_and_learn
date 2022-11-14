class PlacesFacade

  def self.find_sights(country)
    country_data = RestCountryService.search_country_by_name(country).first
    country_object = Country.new(country_data)
    country = PlacesService.find_sights(country_object.capital_long_lat[0], country_object.capital_long_lat[1])
  end
end