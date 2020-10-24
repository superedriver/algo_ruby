def bubble_sort(array)
  last = array.size - 1

  begin
    swapped = false
    for i in (1..last)
      if array[i-1] > array[i]
        array[i-1], array[i] = array[i], array[i-1]
        swapped = true
      end
    end

    last -= 1
  end while swapped

  array
end
