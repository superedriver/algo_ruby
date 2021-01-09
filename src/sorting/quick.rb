def lomuto_partition(array, left, right)
  pivot_i = rand(left..right)
  pivot = array[pivot_i]
  array[right], array[pivot_i] = array[pivot_i], array[right]
  smaller = left - 1
  for i in left...right
    if array[i] < pivot
      smaller += 1
      array[i], array[smaller] = array[smaller], array[i]
    end
  end

  result = smaller+1
  array[result], array[right] = array[right], array[result]
  result
end

def qs_lomuto(array, left, right)
  return if left > right

  j = lomuto_partition(array, left, right)
  qs_lomuto(array, left, j-1)
  qs_lomuto(array, j+1, right)
  array
end

def quick_sort_lomuto(array)
  size = array.size
  return array if size < 2

  qs_lomuto(array, 0, size-1)
end



def hoare_partition(array, left, right)
  return if left >= right

  pivot_i = rand(left..right)
  pivot = array[pivot_i]
  i = left
  j = right
  while true
    while array[i] < pivot
      i += 1
    end
    while array[j] > pivot
      j -= 1
    end

    return j if i >= j
    array[i], array[j] = array[j], array[i]
    i += 1
    j -= 1
  end
end

def qs_hoare(array, left, right)
  return if left >= right

  p = hoare_partition(array, left, right)
  qs_hoare(array, left, p)
  qs_hoare(array, p+1, right)
  array
end

def quick_sort_hoare(array)
  size = array.size
  return array if size < 2

  qs_hoare(array, 0, size-1)
  array
end

quick_sort_hoare([1,3,5,7,5,3,2])