require("minitest/autorun")
require("minitest/rg")
require_relative("../bus_stop.rb")
require_relative("../person.rb")

class BusStopTest < MiniTest::Test

  def setup
    @bob = Person.new("Bob", 25)
    @annie = Person.new("Annie", 40)
    @alan = Person.new("Alan", 30)
    @greg = Person.new("Greg", 80)
    @jenny = Person.new("Jenny", 16)
    @queue1 = [@bob, @annie]
    @queue2 = [@alan, @greg]
    @stop1 = BusStop.new("Tollcross", @queue1)
    @stop2 = BusStop.new("Usher Hall", @queue2)
  end

  def test_bus_stop_name
    assert_equal("Tollcross", @stop1.name)
  end

  def test_bus_stop_queue
    assert_equal(2, @stop2.queue.count)
  end

  def test_bus_stop_add
    @stop2.add_to_queue(@jenny)
    assert_equal(3, @stop2.queue.count)
  end

  def test_bus_stop_empty
    @stop1.empty
    assert_equal(0, @stop1.queue.count)
  end

end
