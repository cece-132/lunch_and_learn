class FavoriteSerializer

  def self.format_favorites(favorites)
    {
      data: 
      favorites.map do |favorite|
        {
          id: favorite.id.to_s,
          type: favorite.class.to_s.downcase,
          attributes: {
            recipe_title: favorite.recipe_title,
            recipe_link: favorite.recipe_link,
            country: favorite.country,
            created_at: favorite.created_at
          }
        }
      end
    }
    
  end

end