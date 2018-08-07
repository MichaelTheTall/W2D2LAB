class BusStop

  attr_reader :name, :queue

  def initialize(name, queue = [])
    @name = name
    @queue = queue
  end

  def add_to_queue(new)
    @queue << new
  end

  def empty
    @queue = []
  end

end
