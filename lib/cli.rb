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
    input = nil
    while input != "exit"

      puts "Enter the class number you'd like more details? Or enter 'list' to see the classes again or 'exit' to exit"

      input = gets.strip.downcase
      if input == "list"
        list_favorite_classes
      elsif input.to_i > 0 && input.to_i <= FavoriteCookingClasses::CookingClass.all.size
        favorite_class = FavoriteCookingClasses::CookingClass.find_class(input.to_i)
        puts "********* #{input}. #{favorite_class.name} *********"
        puts "Description:"
        puts favorite_class.description
        puts " "
        puts "Menu:"
        puts favorite_class.menu
        puts " "
      elsif input == "exit"
        goodbye
      else
        puts "This is not a valid class. Try again."
      end
    end
  end
  def goodbye
    puts "Goodbye"
  end
end
