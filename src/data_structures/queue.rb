require './src/data_structures/list'

class QueueSized
  attr_reader :size, :capacity
  QUEUE_IS_EMPTY = 'Queue is empty'

  def initialize(capacity = 100)
    capacity = 100 if capacity <= 0
    @head = 0
    @tail = 0
    @size = 0
    @capacity = capacity
    @array = Array.new(capacity)
  end

  def enqueue(data)
    @array[@tail] = data
    @size += 1
    @tail = (@tail + 1)%@capacity
    data
  end

  def dequeue
    raise QUEUE_IS_EMPTY if @size == 0
    pop = @array[@head]
    @size -= 1
    @head = (@head + 1)%@capacity
    pop
  end
end
