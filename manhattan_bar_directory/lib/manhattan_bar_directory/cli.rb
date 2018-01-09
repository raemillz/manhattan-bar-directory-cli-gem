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
    start
  end

  def start
    list_neighborhoods
    menu
    puts "Type the number of the bar on which you'd like more information."
    input = gets.strip
    bar = ManhattanBarDirectory::Bars.find(input.to_i)
    selection(bar)
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
    puts "Type the number of the neighborhood you would like more information on."
  end

  def menu
      puts ""
      input = gets.strip

      if input.to_i > 0 && input.to_i < 17
        puts ""
        list_bars(input)
      elsif input.to_i > 16
        puts ""
        puts "Have you been drinking already? That's not one of our options!"
        puts ""
        puts "Type the number of the neighborhood where you would like to explore."
      menu
      end
  end

  def list_bars(from_neighborhood)
    @bars = ManhattanBarDirectory::Bars.all

    if from_neighborhood.to_i == 1
      puts ""
      puts "---------- Bars ----------"
      puts ""
      @bars.each.with_index(1) do |bar, i|
        if (i > 15)
          break;
          end
          puts "#{i}. #{bar.name}"
        end
    elsif from_neighborhood.to_i == 2
      @bars.drop(15).each.with_index(16) do |bar, i|
        if (i > 28)
          break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 3
        @bars.drop(28).each.with_index(29) do |bar, i|
          if (i > 35)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 4
        @bars.drop(35).each.with_index(36) do |bar, i|
          if (i > 46)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 5
        @bars.drop(46).each.with_index(47) do |bar, i|
          if (i > 60)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 6
        @bars.drop(60).each.with_index(61) do |bar, i|
          if (i > 66)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 7
        @bars.drop(66).each.with_index(67) do |bar, i|
          if (i > 69)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 8
        @bars.drop(69).each.with_index(70) do |bar, i|
          if (i > 81)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 9
        @bars.drop(81).each.with_index(82) do |bar, i|
          if (i > 91)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 10
        @bars.drop(91).each.with_index(92) do |bar, i|
          if (i > 98)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 11
        @bars.drop(98).each.with_index(99) do |bar, i|
          if (i > 104)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 12
        @bars.drop(104).each.with_index(105) do |bar, i|
          if (i > 116)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 13
        @bars.drop(116).each.with_index(117) do |bar, i|
          if (i > 122)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 14
        @bars.drop(122).each.with_index(123) do |bar, i|
          if (i > 129)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 15
        @bars.drop(129).each.with_index(130) do |bar, i|
          if (i > 139)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      elsif from_neighborhood.to_i == 16
        @bars.drop(139).each.with_index(140) do |bar, i|
          if (i > 144)
            break;
          end
          puts "#{i}. #{bar.name}"
        end
      end
    puts ""
  end

  def selection(bar)
      puts "#{bar.name} - #{bar.location}"
      puts "Description: #{bar.description}"
      puts ""
  end

  def goodbye
    input = nil

    puts "Would you like to view another bar? Enter Y or N."
    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts "--------------------------------"
      puts "Have fun and drink responsibly!"
    end
  end

end
