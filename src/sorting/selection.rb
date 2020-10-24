def selection_sort(array)
  size = array.size

  for step in 0...size
    # find minimum
    min_idx = step
    for idx in (step+1)...size
      min_idx = idx if array[idx] < array[min_idx]
    end

    # put minimum at the correct position
    array[step], array[min_idx] = array[min_idx], array[step]
  end

  array
end