require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "./bars.rb"

class Scraper

  def self.scrape_neighborhoods
    doc = Nokogiri::HTML(open("https://www.theinfatuation.com/new-york/guides/the-manhattan-bar-directory"))
    neighborhoods = []
    doc.css("h2.post__content__section-header").each do |neighborhood|
      name = neighborhood.text
        neighborhoods << name
      end
    neighborhoods
  end

  def self.scrape_for_bars(url)
    doc = Nokogiri::HTML(open(url))
    bars = []
    doc.css(".spot-block").each do |bar|
      name = bar.css("a h3").text
      description = bar.css(".spot-block__description p").text
        bars << {name: name, description: description}
      end
    bars
  end

end
