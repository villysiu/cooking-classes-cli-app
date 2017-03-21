class FavoriteCookingClasses::CookingClass
  @@all = []
  def initialize(name = nil, url = nil, description = nil, menu = nil)
    @name = name
    @url = url
    @description = description
    @menu = menu
    @@all << self
  end
  
  def self.scrape_customer_favorites

  #  html = open("http://www.surlatable.com/category/cat2211278/Find+a+Cooking+Class")
    base_url = "http://www.surlatable.com/"
    doc = Nokogiri::HTML(open(base_url + "category/cat2211278/Find+a+Cooking+Class"))

    customer_favorites = doc.css("div.boxsides").first

    customer_favorites.css("div.product a").each_with_index do |the_class, i|
      favorite_class = self.new
      favorite_class.name = the_class.children[1]['alt'].sub!('Cooking Class: ', '')
      favorite_class.url = the_class['href']
    end
    @@all
  end
end
