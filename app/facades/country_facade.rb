class CountryFacade

  def self.array_of_country_names
      countries = RestCountryService.find_country
      countries = countries.map do |country_data|
        Country.new(country_data)
        binding.pry
      end
  end

  def self.random_country
    array_of_country_names[rand(array_of_country_names.length)].name
  end
end