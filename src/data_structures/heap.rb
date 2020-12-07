class Heap_Min
  HEAP_IS_EMPTY = 'The heap is Empty'
  # left = 2i+1, right = 2i + 2, father = (i-1)/2
  def initialize(array)
    @last_index = array.size - 1
    @heap = array
    (@heap.size/2).downto(0) { |index| sift_down(index) }
  end

  def insert(value)
    @last_index += 1
    @heap[@last_index] = value
    sift_up(@last_index)
  end

  def extract_min
    raise HEAP_IS_EMPTY  if @last_index == -1
    min = @heap[0]
    @heap[0] = @heap[@last_index]
    @last_index -= 1
    sift_down(0)
    min
  end

  private

  def sift_up(index)
    while index > 0 && @heap[(index-1)/2] > @heap[index]
      @heap[(index-1)/2], @heap[index] = @heap[index], @heap[(index-1)/2]
      index = (index-1)/2
    end
  end

  def sift_down(index)
    while 2*index + 1 <= @last_index
      j = index

      if @heap[2*index + 1] < @heap[j]
        j = 2*index + 1
      end

      if @heap[2*index + 2] && @heap[2*index + 2] < @heap[j]
        j = 2*index + 2
      end

      break if j == index

      @heap[index], @heap[j] = @heap[j], @heap[index]
      index = j
    end
  end
end

class Heap_Max
  HEAP_IS_EMPTY = 'The heap is Empty'
  # left = 2i, right = 2i + 1, father = i/2
  def initialize(array)
    @last_index = array.size
    @heap = [0] + array
    (@heap.size/2).downto(1) { |index| sift_down(index) }
  end

  def insert(value)
    @last_index += 1
    @heap[@last_index] = value
    sift_up(@last_index)
  end

  def extract_max
    raise HEAP_IS_EMPTY  if @last_index == 0
    max = @heap[1]
    @heap[1] = @heap[@last_index]
    @last_index -= 1
    sift_down(1)
    max
  end

  private

  def sift_up(index)
    while index > 1 && @heap[index/2] < @heap[index]
      @heap[index/2], @heap[index] = @heap[index], @heap[index/2]
      index /= 2
    end
  end

  def sift_down(index)
    while 2*index <= @last_index
      j = index

      if @heap[2*index] > @heap[j]
        j = 2*index
      end

      if @heap[2*index + 1] && @heap[2*index + 1] > @heap[j]
        j = 2*index + 1
      end

      break if j == index

      @heap[index], @heap[j] = @heap[j], @heap[index]
      index = j
    end
  end
end