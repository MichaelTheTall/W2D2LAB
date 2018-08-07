class Bus

  attr_reader :route, :destination, :passengers

  def initialize(route, destination, passengers = [])
    @route = route
    @destination = destination
    @passengers = passengers
  end

  def drive
    return "Brum brum!"
  end

  def passenger_count
    return @passengers.count
  end

  def pickup(new)
    @passengers << new
  end

  def dropoff(drop)
    @passengers.delete(drop)
  end

  def empty
    @passengers = []
  end

  def pick_up_from_stop(stop)
    @passengers.concat stop.queue
    stop.empty
  end

end
