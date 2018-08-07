require("minitest/autorun")
require("minitest/rg")
require_relative("../bus.rb")
require_relative("../person.rb")
require_relative("../bus_stop.rb")

class BusTest < MiniTest::Test

  def setup
    @bob = Person.new("Bob", 25)
    @annie = Person.new("Annie", 40)
    @alan = Person.new("Alan", 30)
    @greg = Person.new("Greg", 80)
    @jenny = Person.new("Jenny", 16)

    @queue = [@greg, @jenny]
    @stop = BusStop.new("Usher Hall", @queue)

    @passengers = [@bob, @annie, @alan]
    @bus1 = Bus.new("18", "Hermiston", @passengers)
  end

  def test_bus_has_route
    assert_equal("18", @bus1.route)
  end

  def test_bus_destination
    assert_equal("Hermiston", @bus1.destination)
  end

  def test_bus_drive
    assert_equal("Brum brum!", @bus1.drive)
  end

  def test_bus_passenger_count
    assert_equal(3, @bus1.passenger_count)
  end

  def test_bus_pickup
    @bus1.pickup(@greg)
    assert_equal(4, @bus1.passenger_count)
  end

  def test_bus_dropoff
    @bus1.dropoff(@bob)
    assert_equal(2, @bus1.passenger_count)
  end

  def test_bus_empty
    @bus1.empty
    assert_equal([],@bus1.passengers)
  end

  def test_bus_pick_up_from_stop
    @bus1.pick_up_from_stop(@stop)
    assert_equal(5, @bus1.passenger_count)
    assert_equal(0, @stop.queue.count)
  end

end
