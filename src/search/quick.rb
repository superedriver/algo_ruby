require './src/sorting/quick'

def quick_select(array, left, right, nth)
  while left < right
    p = hoare_partition(array, left, right)
    puts "array: #{array}, left: #{left}, right: #{right}, p: #{p}"

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
