class Recipe 
  attr_reader :id, :title, :url, :image, :country

  def initialize(data)
    @id = nil
    @title = data[:label]
    @url = data[:url]
    @image = data[:image]
    @country = nil
  end

  def set_search_term(country)
    @country = country
  end
end