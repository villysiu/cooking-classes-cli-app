class FavoriteCookingClasses::CLI
  def call
    list_favorite_classes
    menu
  end
  def list_favorite_classes
    puts ""
    puts "**************** Sur La Table ****************"
    puts "***** Customer Favorites Cooking Classes *****"
    puts ""
    FavoriteCookingClasses::CookingClass.all.each_with_index { |the_class, i| puts "#{i+1}. #{the_class.name}" }
  end
  def menu
  
  end
  def goodbye
    puts "Goodbye"
  end
end
