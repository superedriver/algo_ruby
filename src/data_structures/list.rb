class LinkedList
  LIST_IS_EMPTY = 'Linked List is empty'
  class Node
    attr_accessor :data, :next
    def initialize(data = nil, next_node = nil)
      @data = data
      @next = next_node
    end
  end

  def initialize(data = nil)
    @sentinel = Node.new
    @sentinel.next = nil
    @size = 0
    if data
      @sentinel.next = Node.new(data)
      @size += 1
    end
  end

  def add_first(data)
    first = @sentinel.next
    @sentinel.next = Node.new(data, first)
    @size += 1
  end

  def add_last(data)
    craw = @sentinel
    while craw.next
      craw = craw.next
    end
    craw.next = Node.new(data)
    @size += 1
  end

  def get_first
    raise LIST_IS_EMPTY if size == 0
    @sentinel.next
  end

  def delete_first
    raise LIST_IS_EMPTY if size == 0
    removed = @sentinel.next
    @sentinel.next = removed.next
    @size -= 1
    removed.data
  end

  def delete(value)
    craw = @sentinel.next
    prev = @sentinel

    while craw
      if craw.data == value
        if craw.next
          prev.next = craw.next
        else
          prev.next = nil
        end
        @size -= 1
      end

      craw = craw.next
    end
  end

  def size
    @size
  end

  def empty?
    @size == 0
  end
end
