def insertion_sort(array)
  for i in 1...array.size
    j = i
    while j > 0 && array[j-1] > array[j]
      array[j-1], array[j] = array[j], array[j-1]
      j -= 1
    end
  end

  array
end

# 3x faster than previous (Pearls of Programming)
def insertion_sort_optimized(array)
  for i in 1...array.size
    j = i
    t = array[j]
    while j > 0 && array[j-1] > t
      array[j] = array[j-1]
      j -= 1
    end

    array[j] = t
  end

  array
end
