require './src/data_structures/heap'

def heap_sort_min(array)
  heap = Heap_Min.new(array)
  result = []

  until heap.empty?
    result.push(heap.extract_min)
  end

  result
end

def heap_sort_max(array)
  size = array.size
  heap = Heap_Max.new(array)
  result = Array.new(size)

  (size-1).downto(0) do |i|
    result[i] = heap.extract_max
  end

  result
end