require './src/sorting/bubble'
require './src/sorting/selection'
require './src/sorting/insertion'
require './src/sorting/merge'
require './src/sorting/heap'
require './src/sorting/quick'

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

  describe "Merge In Place" do
    describe "merge_in_place helper" do
      it "one" do
        expect(merge_in_place([0,1,2,3,4,5,6,7], 0, 3, 7)).to eq([0,1,2,3,4,5,6,7])
      end

      it "two" do
        expect(merge_in_place([2,3,0,1,4,5,6,7], 0, 1, 3)).to eq([0,1,2,3,4,5,6,7])
      end
    end

    describe "sort_in_place helper" do
      it "one" do
        expect(sort_in_place([3,0,2,1,4,5,6,7], 0, 3)).to eq([0,1,2,3,4,5,6,7])
      end
      it "one" do
        expect(sort_in_place([3,0,2,1,4,5,5,5], 0, 7)).to eq([0,1,2,3,4,5,5,5])
      end
    end

    describe "sorting" do
      it "empty" do
        expect(merge_sort_in_place([])).to eq([])
      end

      it "full" do
        expect(merge_sort_in_place([9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9])
      end

      it "with repetition" do
        expect(merge_sort_in_place([3,4,5,3,4,5,3,4,5,6])).to eq([3,3,3,4,4,4,5,5,5,6])
      end
    end
  end

  describe "Heap" do
    describe "Min" do
      it "empty" do
        heap_sort_min([])
        expect(heap_sort_min([])).to eq([])
      end

      it "full" do
        expect(heap_sort_min([5,4,3,2,1])).to eq([1,2,3,4,5])
      end

      it "with repetition" do
        expect(heap_sort_min([5,5,4,3,3,2,1,1,0])).to eq([0,1,1,2,3,3,4,5,5])
      end
    end

    describe "Max" do
      it "empty" do
        heap_sort_min([])
        expect(heap_sort_max([])).to eq([])
      end

      it "full" do
        expect(heap_sort_max([5,4,3,2,1])).to eq([1,2,3,4,5])
      end

      it "with repetition" do
        expect(heap_sort_max([5,5,4,3,3,2,1,1,0])).to eq([0,1,1,2,3,3,4,5,5])
      end
    end
  end

  describe "Quick" do
    describe "Lomuto" do
      describe "sorting" do
        it "empty" do
          expect(quick_sort_lomuto([])).to eq([])
        end

        it "full" do
          expect(quick_sort_lomuto([9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9])
        end

        it "with repetition" do
          expect(quick_sort_lomuto([3,4,5,3,4,5,3,4,5,6])).to eq([3,3,3,4,4,4,5,5,5,6])
        end
      end
    end

    describe "Hoare" do
      describe "sorting" do
        it "empty" do
          expect(quick_sort_hoare([])).to eq([])
        end

        it "full" do
          expect(quick_sort_hoare([9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9])
        end

        it "with repetition" do
          expect(quick_sort_hoare([3,4,5,3,4,5,3,4,5,6])).to eq([3,3,3,4,4,4,5,5,5,6])
        end
      end
    end
  end
end
