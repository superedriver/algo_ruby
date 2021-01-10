def merge(left, right)
  result = []
  i, j = 0, 0
  n, m = left.size, right.size

  while i < n && j < m
    if left[i] < right[j]
      result.push(left[i])
      i += 1
    else
      result.push(right[j])
      j += 1
    end
  end

  while i < n
    result.push(left[i])
    i += 1
  end
  while j < m
    result.push(right[j])
    j += 1
  end

  result
end

def merge_sort(array)
  size = array.size
  return array if size < 2

  mid = size/2

  merge(merge_sort(array[0...mid]), merge_sort(array[mid..-1]))
end

def merge_in_place(array, left, mid, right)
  # for economy memory, merge result will be in array
  # create temporary array for the first half of array
  temp = array[left..mid]

  i, j = 0, mid+1
  k = left # pointer in result array
  
  while i < temp.size && j <= right
    if temp[i] < array[j]
      array[k] = temp[i]
      i += 1
      k += 1
    else
      array[k] = array[j]
      j += 1
      k += 1
    end
  end

  while i < temp.size
    array[k] = temp[i]
    i += 1
    k += 1
  end
  while j < right
    array[k] = array[j]
    j += 1
    k += 1
  end
  array
end

def sort_in_place(array, left, right)
  return if left >= right

  mid = (left + right)/2
  sort_in_place(array, left, mid)
  sort_in_place(array, mid + 1, right)

  merge_in_place(array, left, mid, right)
end

def merge_sort_in_place(array)
  size = array.size
  return array if size < 2

  sort_in_place(array, 0, size-1)
end
