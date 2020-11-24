require './src/data_structures/segment_tree'

RSpec.describe Segment_Tree_Sum_Recursion do
  describe "build" do
    it "not empty" do
      st = Segment_Tree_Sum_Recursion.new([1,3,5,7,9,11])
      expect(st.instance_variable_get(:@tree)).to eq([nil, 36, 9, 27, 4, 5, 16, 11, 1, 3, nil, nil, 7, 9])
    end

    it "empty" do
      st = Segment_Tree_Sum_Recursion.new([])
      expect(st.instance_variable_get(:@tree)).to eq([])
    end

    it "size = 1" do
      st = Segment_Tree_Sum_Recursion.new([1])
      expect(st.instance_variable_get(:@tree)).to eq([nil, 1, nil])
    end
  end

  describe "get_sum" do
    it "not empty" do
      st = Segment_Tree_Sum_Recursion.new([1,1,1,1,1,1,1,1,1,1])
      expect(st.get_sum(0,1)).to eq(2)
      expect(st.get_sum(0,3)).to eq(4)
      expect(st.get_sum(2,8)).to eq(7)
    end

    it "empty" do
      st = Segment_Tree_Sum_Recursion.new([])
      expect(st.get_sum(0,1)).to eq(0)
      expect(st.get_sum(2,3)).to eq(0)
    end

    it "size = 1" do
      st = Segment_Tree_Sum_Recursion.new([1])
      expect(st.get_sum(2,3)).to eq(0)
      expect(st.get_sum(0,1)).to eq(1)
    end
  end

  describe "update" do
    it "not empty one update" do
      st = Segment_Tree_Sum_Recursion.new([1,1,1,1,1,1,1,1,1,1])
      st.update(2, 2)
      expect(st.get_sum(0,1)).to eq(2)
      expect(st.get_sum(0,3)).to eq(5)
      expect(st.get_sum(2,8)).to eq(8)
    end

    it "not empty two updates" do
      st = Segment_Tree_Sum_Recursion.new([1,1,1,1,1,1,1,1,1,1])
      st.update(2, 2)
      expect(st.get_sum(0,1)).to eq(2)
      expect(st.get_sum(0,3)).to eq(5)
      expect(st.get_sum(2,8)).to eq(8)
      st.update(2, 3)
      expect(st.get_sum(0,1)).to eq(2)
      expect(st.get_sum(0,3)).to eq(6)
      expect(st.get_sum(2,8)).to eq(9)
    end

    it "not empty" do
      st = Segment_Tree_Sum_Recursion.new([1,1,1,1,1,1,1,1,1,1])
      expect(st.get_sum(0,1)).to eq(2)
      expect(st.get_sum(0,3)).to eq(4)
      expect(st.get_sum(2,8)).to eq(7)

      st.update(2, 2)
      expect(st.get_sum(0,1)).to eq(2)
      expect(st.get_sum(0,3)).to eq(5)
      expect(st.get_sum(2,8)).to eq(8)
    end

    it "index is less than 0" do
      st = Segment_Tree_Sum_Recursion.new([1,1,1,1,1,1,1,1,1,1])
      expect{ st.update(-5, 2) }.to raise_error(Segment_Tree_Sum_Recursion::INDEX_OUT_OF_RANGE)
    end

    it "get_index is more than array length" do
      sqrt = Segment_Tree_Sum_Recursion.new([1,2,3,4,5,6,7,8,9])
      expect{ sqrt.update(20, 8) }.to raise_error(Segment_Tree_Sum_Recursion::INDEX_OUT_OF_RANGE)
    end
  end
end
