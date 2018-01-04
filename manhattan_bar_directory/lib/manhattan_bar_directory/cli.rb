require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative"./scraper.rb"
require_relative"./bars.rb"


class ManhattanBarDirectory::CLI

  def call
    make_bars
    puts "Welcome to a directory of some of the best bars in Manhattan!"
    puts ""
    list_neighborhoods
    menu
    goodbye
  end

  def make_bars
    bars_array = Scraper.scrape_for_bars("https://www.theinfatuation.com/new-york/guides/the-manhattan-bar-directory")
    ManhattanBarDirectory::Bars.create_from_collection(bars_array)
  end

  def list_neighborhoods
    puts "Which neighborhood would you like to explore?"
    puts ""
    @neighborhoods = ManhattanBarDirectory::Neighborhood.all
    @neighborhoods.each.with_index(1) do |neighborhood, i|
      puts "#{i}. #{neighborhood}"
    end
    puts ""
    puts "Type the number of the neighborhood you would like more information on, list to see the options again, or exit to leave."
  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      input = gets.strip

      if input.to_i > 0 && input.to_i < 17
        puts ""
        list_bars(input)
      elsif input == "list"
        list_neighborhoods
      elsif input != "list" && input.to_i > 16
        puts "Have you been drinking already? That's not one of our options! Type list or exit."
      end
    end
  end

  def goodbye
    puts "Have fun and drink responsibly!"
  end

  def list_bars(from_neighborhood)
    #@bars = ManhattanBarDirectory::Bars.all

    if from_neighborhood.to_i == 1
      puts ""
      puts "---------- Bars in #{from_neighborhood} ----------"
      puts ""
      ManhattanBarDirectory::Bars.all.each do |bar|
        puts "#{bar.name}"
      end
      #@bars
      #.each.with_index(1) do |bar, i|
      #  if (i > 15)
      #    break;
      #    end
      #    puts "#{i}. #{bar}"
      #  end

      elsif from_neighborhood.to_i == 2
        @bars.drop(15).each.with_index(1) do |bar, i|
          if (i > 13)
            break;
          end
          puts "#{i}. #{bar}"
        end
      elsif from_neighborhood.to_i == 3
        @bars.drop(28).each.with_index(1) do |bar, i|
          if (i > 7)
            break;
          end
          puts "#{i}. #{bar}"
        end
      end
    puts ""
    puts "Type the number of bar you would like more information on."

  #  puts "---------- Bars in #{from_neighborhood} ----------"
  #  puts ""
  #  ManhattanBarDirectory::Bars.all#[from_neighborhood.to_i-1].each.with_index(from_neighborhood) do |bar, index|
      #puts "#{index}. #{bar.name}"
    #end
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
