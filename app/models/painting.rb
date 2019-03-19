# ******* `Painting.all`
#   * Returns an `array` of all the paintings
#
# * `Painting.total_price`
#   * Returns an `integer` that is the total price of all paintings

class Painting

  attr_reader :title, :price, :gallery, :artist

  @@all = []

  def initialize(title, price, gallery, artist)
    @title = title
    @price = price
    @gallery = gallery
    @artist = artist

    # Puts the instance of the painting that we created into an array we can reference later
    @@all << self
  end

  def self.all
    # We are just displaying this value
    @@all
  end



end
