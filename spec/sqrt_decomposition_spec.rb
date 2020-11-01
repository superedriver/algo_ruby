require './src/data_structures/sqrt_decomposition'

RSpec.describe SQRT_Decomp_Sum do
  describe "sum" do
    it "real cases" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect(sqrt.get_sum(0,0)).to eq(1)
      expect(sqrt.get_sum(0,1)).to eq(3)
      expect(sqrt.get_sum(0,2)).to eq(6)
      expect(sqrt.get_sum(0,3)).to eq(10)
      expect(sqrt.get_sum(0,4)).to eq(15)
      expect(sqrt.get_sum(0,5)).to eq(21)
      expect(sqrt.get_sum(3,7)).to eq(30)
      expect(sqrt.get_sum(3,4)).to eq(9)
    end

    it "right is greater than array length" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect(sqrt.get_sum(3,20)).to eq(39)
    end

    it "right is less than 0" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect(sqrt.get_sum(3,-5)).to eq(39)
    end

    it "left is less than 0" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect(sqrt.get_sum(-20,5)).to eq(21)
    end

    it "left is greater than array length" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect(sqrt.get_sum(20,5)).to eq(21)
    end

    it "left is greater than right" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect(sqrt.get_sum(3,0)).to eq(10)
    end
  end

  describe "get_index" do
    it "real indexes" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect(sqrt.get_index(0)).to eq(1)
      expect(sqrt.get_index(1)).to eq(2)
      expect(sqrt.get_index(2)).to eq(3)
    end

    it "get_index is less than 0" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect{ sqrt.get_index(-5) }.to raise_error(SQRT_Decomp_Sum::INDEX_OUT_OF_RANGE)
    end

    it "get_index is more than array length" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect{ sqrt.get_index(20) }.to raise_error(SQRT_Decomp_Sum::INDEX_OUT_OF_RANGE)
    end
  end

  describe "set_index" do
    it "real indexes" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect(sqrt.get_index(1)).to eq(2)
      expect(sqrt.get_sum(1, 3)).to eq(9)

      sqrt.set_index(2, 10)

      expect(sqrt.get_index(2)).to eq(10)
      expect(sqrt.get_sum(1, 3)).to eq(16)
    end

    it "set_index is less than 0" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect{ sqrt.set_index(-5, 20) }.to raise_error(SQRT_Decomp_Sum::INDEX_OUT_OF_RANGE)
    end

    it "set_index is more than array length" do
      sqrt = SQRT_Decomp_Sum.new([1,2,3,4,5,6,7,8,9])
      expect{ sqrt.set_index(20, 20) }.to raise_error(SQRT_Decomp_Sum::INDEX_OUT_OF_RANGE)
    end
  end
end
