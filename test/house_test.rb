require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require 'pry'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_has_attributes
    house = House.new("$400000", "123 sugar lane")
    assert_equal "$400000", house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_rooms_starts_empty
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms
  end

  def test_it_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    house.add(room_1)
    assert_equal [room_1], house.rooms
    house.add(room_2)
    assert_equal [room_1, room_2], house.rooms
  end

  def test_it_find_all_rooms_of_specific_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add(room_1)
    house.add(room_2)
    house.add(room_3)
    house.add(room_4)
    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_4], house.rooms_from_category(:basement)
    assert_equal [], house.rooms_from_category(:kitchen)
  end

  def test_if_it_can_calculate_total_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    assert_equal 0, house.area
    house.add(room_1)
    house.add(room_2)
    assert_equal 295, house.area
    house.add(room_3)
    house.add(room_4)
    assert_equal 1900, house.area
  end

  def test_it_can_calculate_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add(room_1)
    house.add(room_2)
    house.add(room_3)
    house.add(room_4)
    assert_equal 210.53, house.price_per_square_foot
  end

  def test_it_can_sort_rooms_by_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add(room_1)
    house.add(room_2)
    house.add(room_3)
    house.add(room_4)
    assert_equal [room_4, room_3, room_2, room_1], house.rooms_sorted_by_area
  end


end
