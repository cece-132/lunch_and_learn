class PlacesFacade

  def self.find_sights(country)
    country_data = RestCountryService.search_country_by_name(country)
    binding.pry
    country = PlacesService.find_sights(country)
  end
end