require './src/sorting/bubble'
require './src/sorting/selection'
require './src/sorting/insertion'
require './src/sorting/merge'

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

  describe "Insertion Optimized" do
    it "empty" do
      expect(insertion_sort_optimized([])).to eq([])
    end

    it "full" do
      expect(insertion_sort_optimized([9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9])
    end

    it "with repetition" do
      expect(insertion_sort_optimized([3,4,5,3,4,5,3,4,5,6])).to eq([3,3,3,4,4,4,5,5,5,6])
    end
  end

  describe "Merge" do
    describe "merge helper" do
      it "empty" do
        expect(merge([], [])).to eq([])
      end

      it "full" do
        expect(merge([1,2,3,4,5], [6,7,8,9])).to eq([1,2,3,4,5,6,7,8,9])
      end

      it "with repetition" do
        expect(merge([1,1,2,3,4,4,5], [5,7,7,9])).to eq( [1,1,2,3,4,4,5,5,7,7,9])
      end
    end

    describe "sorting" do
      it "empty" do
        expect(merge_sort([])).to eq([])
      end

      it "full" do
        expect(merge_sort([9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9])
      end

      it "with repetition" do
        expect(merge_sort([3,4,5,3,4,5,3,4,5,6])).to eq([3,3,3,4,4,4,5,5,5,6])
      end
    end
  end
end
