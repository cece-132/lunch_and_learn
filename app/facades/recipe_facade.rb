class RecipeFacade

  def self.search_countries(country)
    recipes = EdamamService.search_countries(country)
  end

end