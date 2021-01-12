class Stack
  STACK_IS_EMPTY = 'Stack is empty'
  def initialize(data = nil)
    @last = -1
    @stack = []
    if data
      @last += 1
      @stack[@last] = data
    end
  end

  def push(data)
    @last += 1
    @stack[@last] = data
  end

  def pop
    raise STACK_IS_EMPTY if size == 0
    val = @stack[@last]
    @last -= 1
    val
  end

  def size
    @last + 1
  end

  def empty?
    @last === -1
  end
end