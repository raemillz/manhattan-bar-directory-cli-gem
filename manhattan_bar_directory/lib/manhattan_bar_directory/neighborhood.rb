require 'pry'
class ManhattanBarDirectory::Neighborhood

#  @@all = []
#  doc = Nokogiri::HTML(open("https://www.theinfatuation.com/new-york/guides/the-manhattan-bar-directory"))

#  def initialize(doc)
#    doc.css("h2.post__content__section-header").each do |neighborhood|
#      name = neighborhood.text
#        @@all << self
#      end
#  end



  def self.all
    self.scrape_neighborhoods
  end

  def self.scrape_neighborhoods
    doc = Nokogiri::HTML(open("https://www.theinfatuation.com/new-york/guides/the-manhattan-bar-directory"))
    neighborhoods = []
    doc.css("h2.post__content__section-header").each do |neighborhood|
      name = neighborhood.text
        neighborhoods << name
      end
    neighborhoods
  end

  def self.scrape_site

  end

end
