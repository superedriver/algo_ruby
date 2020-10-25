require './src/sorting/bubble'
require './src/sorting/selection'
require './src/sorting/insertion'

RSpec.describe 'Sorting' do
  describe "Bubble" do
    it "empty" do
      expect(bubble_sort([])).to eq([])
    end

    it "full" do
      expect(bubble_sort([9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9])
    end

    it "with repetition" do
      expect(bubble_sort([3,4,5,3,4,5,3,4,5,6])).to eq([3,3,3,4,4,4,5,5,5,6])
    end
  end

  describe "Selection" do
    it "empty" do
      expect(selection_sort([])).to eq([])
    end

    it "full" do
      expect(selection_sort([9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9])
    end

    it "with repetition" do
      expect(selection_sort([3,4,5,3,4,5,3,4,5,6])).to eq([3,3,3,4,4,4,5,5,5,6])
    end
  end

  describe "Insertion" do
    it "empty" do
      expect(insertion_sort([])).to eq([])
    end

    it "full" do
      expect(insertion_sort([9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9])
    end

    it "with repetition" do
      expect(insertion_sort([3,4,5,3,4,5,3,4,5,6])).to eq([3,3,3,4,4,4,5,5,5,6])
    end
  end
end
