class Segment_Tree_Sum
  INDEX_OUT_OF_RANGE = 'Index is out of range'
  def initialize(array)
    @size = array.size
    return @tree = [] if @size == 0

    @tree = Array.new(@size*2+1)

    build(array,1, 0, @size - 1)
  end

  def get_sum(l, r)
    return 0 if @size == 0
    l = 0 if l < 0
    r = @size - 1 if r >= @size

    sum(l, r, 1, 0, @size - 1)
  end

  def update(index, value)
    raise INDEX_OUT_OF_RANGE  if index < 0 || index >= @size

    update_v(index, value, 1,0, @size - 1)
  end

  private

  # build the segment tree from array
  # v - vertex number
  # tl - left segment boundary
  # tr - right segment boundary
  def build(array, v, tl, tr)
    if tl == tr
      @tree[v] = array[tr]
    else
      m = (tl + tr)/2

      build(array, v*2, tl, m)
      build(array, v*2 + 1, m + 1, tr)
      @tree[v] = @tree[v*2] + @tree[v*2 + 1]
    end
  end

  # get_sum on segment
  # l - left request boundary
  # r - right request boundary
  # v - vertex number
  # tl - left segment boundary
  # tr - right segment boundary
  def sum(l, r, v, tl, tr)
    return 0 if tr < l || r < tl
    return @tree[v] if l <= tl && tr <= r

    m = (tr + tl)/2
    sum(l, r, v*2, tl, m) + sum(l, r, v*2 + 1, m+1, tr)
  end

  # update index
  # index - index for update
  # value - new value
  # v - vertex number
  # tl - left segment boundary
  # tr - right segment boundary
  def update_v(index, value, v, tl, tr)
    return if index < tl || tr < index

    if tl == index && tr == index
      @tree[v] = value
      return
    end

    m = (tr + tl)/2
    update_v(index, value, v*2, tl, m)
    update_v(index, value, v*2 + 1, m + 1, tr)

    @tree[v] = @tree[v*2] + @tree[v*2 + 1]
  end
end
