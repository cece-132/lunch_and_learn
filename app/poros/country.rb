class Country
  attr_reader :name,
              :latlng

  def initialize(data)
    binding.pry
    @name = data[:name][:common]
    @latlng = data[:latlng]
  end
end