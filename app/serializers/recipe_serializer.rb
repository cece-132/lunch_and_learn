class RecipeSerializer
  include JSONAPI::Serializer
  attributes id: null, :type, :title, :url, :image, :country
end