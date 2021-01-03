require './src/data_structures/heap'

RSpec.describe Heap_Min do
  describe "build" do
    it "not empty" do
      heap = Heap_Min.new([10,8,7,12,15,1,2,3])
      expect(heap.instance_variable_get(:@heap)).to eq([1, 3, 2, 8, 15, 7, 10, 12])
      expect(heap.instance_variable_get(:@last_index)).to eq(7)
    end

    it "empty" do
      heap = Heap_Min.new([])
      expect(heap.instance_variable_get(:@heap)).to eq([])
      expect(heap.instance_variable_get(:@last_index)).to eq(-1)
    end

    it "without arguments" do
      heap = Heap_Min.new
      expect(heap.instance_variable_get(:@heap)).to eq([])
      expect(heap.instance_variable_get(:@last_index)).to eq(-1)
    end
  end

  describe "insert" do
    it "not empty" do
      heap = Heap_Min.new([10,8,7,12,15,1,2,3])
      heap.insert(0)
      expect(heap.instance_variable_get(:@heap)).to eq([0, 1, 2, 3, 15, 7, 10, 12, 8])
      expect(heap.instance_variable_get(:@last_index)).to eq(8)
    end

    it "empty" do
      heap = Heap_Min.new([])
      heap.insert(0)
      expect(heap.instance_variable_get(:@heap)).to eq([0])
      expect(heap.instance_variable_get(:@last_index)).to eq(0)
    end
  end

  describe "extract_min" do
    it "not empty" do
      heap = Heap_Min.new([10,8,7,12,15,1,2,3])
      expect(heap.instance_variable_get(:@heap)).to eq([1, 3, 2, 8, 15, 7, 10, 12])
      min = heap.extract_min
      expect(min).to eq(1)
      expect(heap.instance_variable_get(:@heap)).to eq([2, 3, 7, 8, 15, 12, 10, 12])
      expect(heap.instance_variable_get(:@last_index)).to eq(6)
      min = heap.extract_min
      expect(min).to eq(2)
      expect(heap.instance_variable_get(:@heap)).to eq([3, 8, 7, 10, 15, 12, 10, 12])
      expect(heap.instance_variable_get(:@last_index)).to eq(5)
    end

    it "empty" do
      heap = Heap_Min.new([])
      expect{ heap.extract_min }.to raise_error(Heap_Min::HEAP_IS_EMPTY)
    end
  end

  describe "empty?" do
    it "not empty" do
      heap = Heap_Min.new([10,8])
      heap.extract_min
      expect(heap.empty?).to eq(false)
      heap.extract_min
      expect(heap.empty?).to eq(true)
    end

    it "empty" do
      heap = Heap_Max.new([])
      expect(heap.empty?).to eq(true)
    end
  end

  describe "size" do
    it "not empty" do
      heap = Heap_Min.new([10,8])
      expect(heap.size).to eq(2)
      heap.extract_min
      expect(heap.size).to eq(1)
      heap.extract_min
      expect(heap.size).to eq(0)
    end

    it "empty" do
      heap = Heap_Min.new([])
      expect(heap.size).to eq(0)
    end
  end

  describe "peak" do
    it "not empty" do
      heap = Heap_Min.new([10,8])
      expect(heap.peek).to eq(8)
    end

    it "empty" do
      heap = Heap_Min.new([])
      expect{ heap.peek }.to raise_error(Heap_Min::HEAP_IS_EMPTY)
    end
  end
end

RSpec.describe Heap_Max do
  describe "build" do
    it "not empty" do
      heap = Heap_Max.new([10,8,7,12,15,1,2,3])
      expect(heap.instance_variable_get(:@heap)).to eq([0, 15, 12, 7, 10, 8, 1, 2, 3])
      expect(heap.instance_variable_get(:@last_index)).to eq(8)
    end

    it "empty" do
      heap = Heap_Max.new([])
      expect(heap.instance_variable_get(:@heap)).to eq([0])
      expect(heap.instance_variable_get(:@last_index)).to eq(0)
    end

    it "without arguments" do
      heap = Heap_Max.new
      expect(heap.instance_variable_get(:@heap)).to eq([0])
      expect(heap.instance_variable_get(:@last_index)).to eq(0)
    end
  end

  describe "insert" do
    it "not empty" do
      heap = Heap_Max.new([10,8,7,12,15,1,2,3])
      heap.insert(20)
      expect(heap.instance_variable_get(:@heap)).to eq([0, 20, 15, 7, 12, 8, 1, 2, 3, 10])
      expect(heap.instance_variable_get(:@last_index)).to eq(9)
    end

    it "empty" do
      heap = Heap_Max.new([])
      heap.insert(20)
      expect(heap.instance_variable_get(:@heap)).to eq([0, 20])
      expect(heap.instance_variable_get(:@last_index)).to eq(1)
    end
  end

  describe "extract_max" do
    it "not empty" do
      heap = Heap_Max.new([10,8,7,12,15,1,2,3])
      expect(heap.instance_variable_get(:@heap)).to eq([0, 15, 12, 7, 10, 8, 1, 2, 3])
      max = heap.extract_max
      expect(max).to eq(15)
      expect(heap.instance_variable_get(:@heap)).to eq([0, 12, 10, 7, 3, 8, 1, 2, 3])
      expect(heap.instance_variable_get(:@last_index)).to eq(7)
      max = heap.extract_max
      expect(max).to eq(12)
      expect(heap.instance_variable_get(:@heap)).to eq([0, 10, 8, 7, 3, 2, 1, 2, 3])
      expect(heap.instance_variable_get(:@last_index)).to eq(6)
    end

    it "empty" do
      heap = Heap_Max.new([])
      expect{ heap.extract_max }.to raise_error(Heap_Max::HEAP_IS_EMPTY)
    end
  end

  describe "empty?" do
    it "not empty" do
      heap = Heap_Max.new([10,8])
      heap.extract_max
      expect(heap.empty?).to eq(false)
      heap.extract_max
      expect(heap.empty?).to eq(true)
    end

    it "empty" do
      heap = Heap_Max.new([])
      expect(heap.empty?).to eq(true)
    end
  end

  describe "size" do
    it "not empty" do
      heap = Heap_Max.new([10,8])
      expect(heap.size).to eq(2)
      heap.extract_max
      expect(heap.size).to eq(1)
      heap.extract_max
      expect(heap.size).to eq(0)
    end

    it "empty" do
      heap = Heap_Max.new([])
      expect(heap.size).to eq(0)
    end
  end

  describe "peak" do
    it "not empty" do
      heap = Heap_Max.new([10,8,100])
      expect(heap.peek).to eq(100)
    end

    it "empty" do
      heap = Heap_Max.new([])
      expect{ heap.peek }.to raise_error(Heap_Max::HEAP_IS_EMPTY)
    end
  end
end
