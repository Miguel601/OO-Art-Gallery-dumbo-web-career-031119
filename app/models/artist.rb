# ***** `Artist.all`
#   * Returns an `array` of all the artists
#
# *** `Artist#paintings`
#   * Returns an `array` all the paintings by an artist
#
# **** `Artist#galleries`
#   * Returns an `array` of all the galleries that an artist has paintings in
#
# **** `Artist#cities`
#   * Return an `array` of all cities that an artist has paintings in
#
# ***** `Artist.total_experience`
#   * Returns an `integer` that is the total years of experience of all artists
#
# * `Artist.most_prolific`
#   * Returns an `instance` of the artist with the highest amount of paintings per year of experience.
#
# **** `Artist#create_painting`
#   * Given the arguments of `title`, `price` and `gallery`, creates a new painting belonging to that artist


class Artist

  @@all = []

  attr_reader :name, :years_experience

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    # Return an array of all Paintings
    # this artist has made
    # prince.paintings
    # 1. All of our paintings exist in Painting.all
    # 2. Iterate through each one and see
    # if it matches this particular artist
    Painting.all.select do |painting|
      # If this painting's artist matches the person who is calling
      # <Artist>  == "Prince" "Check an instance against a string"
      # "Prince" == "Prince" "Check an attribute about these objects"
      # <Artist> == <Artist> "Check if these two objects are the same"
       painting.artist == self
    end
  end

  def galleries
    # An array of all the galleries
    # this artist has paintings in
    # 1. Find all of the paintings that this
    # artist has made
    # 2. For each of those paintings,
    # return their gallery
    self.paintings.collect do |painting|
      painting.gallery
    end

    # Let's remember not to do this
    # Painting.all.collect do |painting|
    #   if painting.artist == self
    #     painting.gallery
    #   end
    # end
  end

  def cities
     # Return an `array` of all cities that an artist has paintings in
     self.galleries.map do |gallery|
       gallery.city
     end
  end

  # Rubocop

  # * `Artist#create_painting`
  #   * Given the arguments of `title`, `price` and `gallery`, creates a new painting belonging to that artist
  def create_painting(title, price, gallery)
    # How do I make sure to tell this
    # painting that THIS artist is the
    # person who wrote it?
    Painting.new(title, price, gallery, self)
  end

  # * `Artist.total_experience`
  #   * Returns an `integer` that is the total years of experience of all artists
  def self.total_experience
    # 1. Find all of the artists
    # 2. Find their years of experience
    # 3. Add it all up
    counter = 0
    @@all.each do |artist|
      counter += artist.years_experience
    end

    counter
  end


  # * `Artist.most_prolific`
  #   * Returns an `instance` of the artist with the highest amount of paintings per year of experience.
  def self.most_prolific
    # 1. Find all of the artists @@all
    # 2. For each of our artists, find the number of paintings divided by years of experience
    # 3. Sort by above condition and return first
    # binding.pry
    # @@all.sort_by { |artist| artist.paintings.length / artist.years_experience }.last
    @@all.sort_by do |artist|
      artist.paintings.length / artist.years_experience
    end.last
  end
end
