require './src/search/linear'
require './src/search/sentinel_linear'

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
  end
end