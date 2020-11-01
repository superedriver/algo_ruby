class SQRT_Decomp_Sum
  INDEX_OUT_OF_RANGE = 'Index is out of range'
  def initialize(array)
    size = array.size
    @array = array
    @blocks_count = Math.sqrt(size).ceil
    @blocks = Array.new(@blocks_count, 0)

    (0...size).each_with_index { |val, index|  @blocks[index/@blocks_count] += val }
  end

  def get_sum(left, right)
    left = 0 if left < 0 || left >= @array.size
    right = @array.size-1 if right < 0 || right >= @array.size

    if left > right
      left, right = right, left
    end

    sum = 0
    left_block = left/@blocks_count
    right_block = right/@blocks_count

    if left_block == right_block
      (left..right).each { |i| sum += @array[i] }
      return sum
    end

    (left...((left_block+1) * @blocks_count)).each { |i| sum += @array[i] }
    ((left_block + 1)...right_block).each { |i| sum += @blocks[i] }
    ((right_block * @blocks_count)..right).each { |i| sum += @array[i] }

    sum
  end

  def get_index(index)
    raise INDEX_OUT_OF_RANGE  if index < 0 || index >= @array.size
    @array[index]
  end

  def set_index(index, value)
    raise INDEX_OUT_OF_RANGE  if index < 0 || index >= @array.size

    block_index = index/@blocks_count
    @blocks[block_index] += value - self.get_index(index)
    @array[index] = value
  end
end
