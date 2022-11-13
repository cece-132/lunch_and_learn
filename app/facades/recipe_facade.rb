class RecipeFacade

  def self.search_countries(country)
    data = EdamamService.search_countries(country)
    recipes = data[:hits].map do |recipe_data|
      Recipe.new(recipe_data, country)
    end
  end

end