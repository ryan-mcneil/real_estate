require './lib/room'

class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.inject(0) do |sum, room|
      sum += room.area
    end
  end

  def price_per_square_foot
    price_f = @price[1..-1].to_f
    (price_f/area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end.reverse
  end

  def rooms_by_category
    hash = Hash.new([])
    @rooms.each do |room|
      hash[room.category] = rooms_from_category(room.category)
    end
    hash
  end

end
