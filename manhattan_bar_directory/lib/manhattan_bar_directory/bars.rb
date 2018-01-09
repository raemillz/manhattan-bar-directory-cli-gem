class ManhattanBarDirectory::Bars
    attr_accessor :name, :description, :location

    @@all = []

    def initialize(bar_hash)
     bar_hash.each {|attrib, value| self.send("#{attrib}=", value)}
     @@all << self
   end

   def self.create_from_collection(bars_array)
     bars_array.each {|bar_hash| self.new(bar_hash)}
   end

   def self.all
      @@all
   end

   def self.find(id)
     self.all[id-1]
   end

end
