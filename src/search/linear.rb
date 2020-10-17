def linear_search(arr, val)
  size = arr.size
  return -1 if size == 0
  i = 0
  while i < size
    if arr[i] == val
      return i
    end
    i += 1
  end

  -1
end

def sentinel_linear_search(arr, val)
  size = arr.size
  return -1 if size == 0
  last_index = size-1
  last = arr[last_index]
  arr[last_index] = val

  i = 0
  while arr[i] != val
    i += 1
  end

  arr[last_index] = last

  if i < last_index || arr[last_index] == val
    return i
  end

  -1
end
