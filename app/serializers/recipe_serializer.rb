class RecipeSerializer

  def self.format_recipes(recipes)
    {
      data: recipes.map do |recipe|
        {
          id: nil,
          type: "recipe",
          attributes: {
            title: recipe.title,
            url: recipe.url,
            country: recipe.country,
            image: recipe.image
          }
        }
      end
    }
  end

end