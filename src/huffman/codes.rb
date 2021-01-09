require './src/data_structures/heap'

class Huff
  FILE_IS_NOT_EXIST = 'File Is Not Exist'

  class Node
    include Comparable
    attr :sum, :code

    def <=>(other_node)
      sum <=> other_node.sum
    end

    def initialize(sum)
      @sum = sum
      @code = ''
    end

    def build_code(code)
      @code = code
    end
  end

  class InternalNode < Node
    def initialize(left, right)
      super left.sum + right.sum

      @left = left
      @right = right
    end

    def build_code(code)
      @left.build_code(code + '1')
      @right.build_code(code + '0')
    end
  end

  class LeafNode < Node
    attr :sum, :code

    def initialize(symbol, frequency)
      super frequency
      @symbol = symbol
    end

    def build_code(code)
      super
      #puts "symbol: #{@symbol} code: #{code}"
    end
  end

  def initialize
    @symbols = []
    @freq = Hash.new(0)
  end

  def run_file(file)
    raise FILE_IS_NOT_EXIST unless File.exist?(file)
    run_text(File.read(file))
  end

  def run_text(string = '')
    return '' if !string || string.empty?
    string.each_char { |symbol| @freq[symbol] += 1 }

    pq = Heap_Min.new
    char_to_node = {}

    @freq.each do |symbol, frequency|
      leaf = LeafNode.new(symbol, frequency)
      pq.insert(leaf)

      char_to_node[symbol] = leaf
    end

    while pq.size > 1 do
      first = pq.extract_min
      second = pq.extract_min

      inode = InternalNode.new(first, second)
      pq.insert(inode)
    end

    root = pq.extract_min

    root.build_code('')

    ans = ''
    string.each_char { |curr| ans += char_to_node[curr].code }

    ans
  end
end
