def binary_search(arr, val)
  size = arr.size
  return -1 if size == 0

  bad = -1
  good = size

  while good - bad > 1
    # m = (good + bad)/2
    m = bad + (good-bad)/2
    if arr[m] >= val
      good = m
    else
      bad = m
    end
  end

  good < size && arr[good] == val ? good : -1
end

def binary_search_first_entry(arr, val)
  size = arr.size
  return 0 if size == 0
  bad = -1
  good = size

  while good - bad > 1

    m = (good + bad)/2
    if arr[m] >= val
      good = m
    else
      bad = m
    end
  end

  good
end

def binary_search_last_entry(arr, val)
  size = arr.size
  return 0 if size == 0
  bad = -1
  good = arr.size

  while good - bad > 1

    m = (good + bad)/2
    if arr[m] > val
      good = m
    else
      bad = m
    end
  end

  # good place for insertion insert
  arr[bad] == val ? bad : good
end