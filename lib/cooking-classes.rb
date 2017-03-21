class FavoriteCookingClasses::CookingClass
  @@all = []
  def initialize(name = nil, url = nil, description = nil, menu = nil)
    @name = name
    @url = url
    @description = description
    @menu = menu
    @@all << self
  end

end
