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