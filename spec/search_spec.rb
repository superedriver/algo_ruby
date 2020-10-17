require './src/search/linear'
require './src/search/binary'

RSpec.describe "Search" do
  describe "Linear" do
    before(:each) do
      @array = [0,1,2,3,4,5]
    end

    it "has value" do
      expect(linear_search(@array, 0)).to eq(0)
      expect(linear_search(@array, 1)).to eq(1)
      expect(linear_search(@array, 2)).to eq(2)
      expect(linear_search(@array, 3)).to eq(3)
      expect(linear_search(@array, 4)).to eq(4)
      expect(linear_search(@array, 5)).to eq(5)
    end

    it "No value" do
      expect(linear_search(@array, 6)).to eq(-1)
    end

    it "empty array" do
      expect(linear_search([], 6)).to eq(-1)
    end
  end

  describe "Sentinel Linear" do
    before(:each) do
      @array = [0,1,2,3,4,5]
    end

    it "has value" do
      expect(sentinel_linear_search(@array, 0)).to eq(0)
      expect(sentinel_linear_search(@array, 1)).to eq(1)
      expect(sentinel_linear_search(@array, 2)).to eq(2)
      expect(sentinel_linear_search(@array, 3)).to eq(3)
      expect(sentinel_linear_search(@array, 4)).to eq(4)
      expect(sentinel_linear_search(@array, 5)).to eq(5)
    end

    it "No value" do
      expect(sentinel_linear_search(@array, 6)).to eq(-1)
    end

    it "empty array" do
      expect(sentinel_linear_search([], 6)).to eq(-1)
    end
  end

  describe "Binary" do
    describe "Search" do
      before(:each) do
        @array = [0,1,2,2,2,5]
      end

      it "has values" do
        expect(binary_search(@array, 0)).to eq(0)
        expect(binary_search(@array, 1)).to eq(1)
        expect(binary_search(@array, 2)).to eq(2)
        expect(binary_search(@array, 5)).to eq(5)
      end

      it "out of range" do
        expect(binary_search(@array, -10)).to eq(-1)
        expect(binary_search(@array, 6)).to eq(-1)
      end

      it "no values" do
        expect(binary_search(@array, 3)).to eq(-1)
        expect(binary_search(@array, 4)).to eq(-1)
      end

      it "empty array" do
        expect(binary_search([], 6)).to eq(-1)
      end
    end

    describe "First Entry" do
      before(:each) do
        @array = [0,1,2,2,2,5]
      end

      it "in range" do
        expect(binary_search_first_entry(@array, 0)).to eq(0)
        expect(binary_search_first_entry(@array, 1)).to eq(1)
        expect(binary_search_first_entry(@array, 2)).to eq(2)
        expect(binary_search_first_entry(@array, 3)).to eq(5)
        expect(binary_search_first_entry(@array, 4)).to eq(5)
        expect(binary_search_first_entry(@array, 5)).to eq(5)
      end

      it "out of range" do
        expect(binary_search_first_entry(@array, -10)).to eq(0)
        expect(binary_search_first_entry(@array, 6)).to eq(6)
      end

      it "empty array" do
        expect(binary_search_first_entry([], 6)).to eq(0)
      end
    end

    describe "Last Entry" do
      before(:each) do
        @array = [0,1,2,2,2,5]
      end

      it "in range" do
        expect(binary_search_last_entry(@array, 0)).to eq(0)
        expect(binary_search_last_entry(@array, 1)).to eq(1)
        expect(binary_search_last_entry(@array, 2)).to eq(4)
        expect(binary_search_last_entry(@array, 3)).to eq(5)
        expect(binary_search_last_entry(@array, 4)).to eq(5)
        expect(binary_search_last_entry(@array, 5)).to eq(5)
      end

      it "out of range" do
        expect(binary_search_last_entry(@array, -10)).to eq(0)
        expect(binary_search_last_entry(@array, 6)).to eq(6)
      end

      it "empty array" do
        expect(binary_search_last_entry([], 6)).to eq(0)
      end
    end
  end
end