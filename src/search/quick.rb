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

def quick_select(array, left, right, nth)
  while left < right
    p = lomuto_partition(array, left, right)
    puts "array: #{array}, left: #{left}, right: #{right}, p: #{p}, nth: #{nth}"

    if p > nth
      right = p - 1
    elsif p < nth
      left = p + 1
    else
      return array[p]
    end
  end
end

def nth_element(array, nth)
  quick_select(array, 0, array.size-1, nth)
end

puts "here: #{nth_element([10,2,5,7,8,3,0], 2)}"