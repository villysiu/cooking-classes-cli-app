class FavoriteCookingClasses::CookingClass
  @@all = []
  @@base_url = "http://www.surlatable.com/"
  
  def initialize(name = nil, url = nil, description = nil, menu = nil)
    @name = name
    @url = url
    @description = description
    @menu = menu
    @@all << self
  end
  
  def self.all
    @@all.empty? ? scrape_customer_favorites : @@all
  end
  
  def self.scrape_customer_favorites
    doc = Nokogiri::HTML(open(@@base_url + "category/cat2211278/Find+a+Cooking+Class"))
    customer_favorites = doc.css("div.boxsides").first

    customer_favorites.css("div.product a").each do |the_class|
      favorite_class = self.new
      favorite_class.name = the_class.children[1]['alt'].sub!('Cooking Class: ', '')
      favorite_class.url = the_class['href']
    end
    @@all
  end
    def description
    if @description.nil?
      class_details = Nokogiri::HTML(open(@@base_url + "#{self.url}"))
      @description = class_details.css("div.boxsides").children[6].text
    end
    @description
  end
  def menu
    if @menu.nil?
      class_details = Nokogiri::HTML(open(@@base_url + "#{self.url}"))
      @menu = class_details.css("div.boxsides").children[2].text
    end
    @menu
  end
end
