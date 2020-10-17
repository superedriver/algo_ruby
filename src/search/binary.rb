def linear_search(arr, val)
  size = arr.size
  i = 0
  while i < size
    if arr[i] == val
      return i
    end
    i += 1
  end

  -1
end