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