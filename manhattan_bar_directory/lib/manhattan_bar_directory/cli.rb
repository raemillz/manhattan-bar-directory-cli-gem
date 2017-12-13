class ManhattanBarDirectory::CLI

  def call
    list_neighborhoods
    menu
    goodbye
  end

  def list_neighborhoods
    puts "Manhattan 'hoods:"
    puts <<-DOC
    1. East Village
    2. West Village
    3. Greenwich Village
    4. Soho & Nolita
    5. Lower East Side & Chinatown
    6. Tribeca
    7. Financial District
    8. Flatiron/ Nomad
    9. Gramercy/ Murray Hill
    10. Chelsea
    11. Midtown East
    12. Midtown West
    13. Upper East Side
    14. Upper West Side
    15. Harlem, East Harlem, Morningside Heights
    16. Washington Heights/ Inwood
    DOC
    puts ""
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the neighborhood where you would like to drink, or type list to see the options again, or type exit to leave."
      input = gets.strip
      case input
      when "1"
        puts "These are some great bars in the East Village:"
      when "2"
        puts "These are some great bars in the West Village:"
      when "3"
        puts "These are some great bars in Greenwich Village:"
      when "4"
        puts "These are some great bars in Soho & Nolita:"
      when "5"
        puts "These are some great bars in the Lower East Side & Chinatown:"
      when "6"
        puts "These are some great bars in Tribeca:"
      when "7"
        puts "These are some great bars in the Financial District:"
      when "8"
        puts "These are some great bars in Flatiron/ Nomad:"
      when "9"
        puts "These are some great bars in Gramercy/ Murray Hill:"
      when "10"
        puts "These are some great bars in Chelsea:"
      when "11"
        puts "These are some great bars in Midtown East:"
      when "12"
        puts "These are some great bars in Midtown West:"
      when "13"
        puts "These are some great bars in the Upper East Side:"
      when "14"
        puts "These are some great bars in the Upper West Side:"
      when "15"
        puts "These are some great bars in Harlem, East Harlem, & Morningside Heights"
      when "16"
        puts "These are some great bars in Washington Heights/ Inwood:"
      when "list"
        list_neighborhoods
      else
        puts "Have you been drinking already? That's not one of our options! Type list or exit."
      end
    end
  end

  def goodbye
    puts "Have fun and drink responsibly!"
  end

  def print_bars(from_neighborhood)
    puts ""
    puts "---------- Bars in #{from_neighborhood} ----------"
    puts ""
    ManhattanBarDirectory::Bars.all[from_neighborhood-1].each.with_index(from_neighborhood) do |bar, index|
      puts "#{index}. #{bar.name}"
    end
  end

  def print_bar(bar)
    puts ""
puts "----------- #{bar.name} -----------"
puts ""
puts "Location:           #{restaurant.location}"
puts ""
puts "---------------Description--------------"
puts ""
puts "#{restaurant.description}"
puts ""
  end

end
