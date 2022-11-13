class CountryFacade

  def self.array_of_country_names
    Rails.cache.fetch("my_cache_key/countries_array", expires_in: 48.hours) do
      countries = RestCountryService.find_country
      countries = countries.map do |country_data|
        Country.new(country_data)
      end
    end
  end

  def self.random_country
    array_of_country_names[rand(array_of_country_names.length)].name
  end
end