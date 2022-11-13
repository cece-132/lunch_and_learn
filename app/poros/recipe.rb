class Recipe
  attr_reader :title,
              :url,
              :image,
              :country
              
  def initialize(data, search_param)
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @country = search_param
    @image = data[:recipe][:image]
  end
end