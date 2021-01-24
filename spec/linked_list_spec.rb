require './src/data_structures/list'

RSpec.describe LinkedList do
  describe "new" do
    it "empty" do
      ll = LinkedList.new
      expect(ll.size).to eq(0)
      expect{ ll.get_first }.to raise_error(LinkedList::LIST_IS_EMPTY)
    end

    it "not empty" do
      ll = LinkedList.new(5)
      expect(ll.size).to eq(1)
      expect(ll.get_first.data).to eq(5)
    end
  end

  describe "add first" do
    it "empty ll" do
      ll = LinkedList.new
      ll.add_first(9)
      expect(ll.size).to eq(1)
      expect(ll.get_first.data).to eq(9)
    end

    it "not empty ll" do
      ll = LinkedList.new(5)
      ll.add_first(9)
      expect(ll.size).to eq(2)
      expect(ll.get_first.data).to eq(9)
    end

    it "three times" do
      ll = LinkedList.new(5)
      ll.add_first(9)
      ll.add_first(8)
      expect(ll.size).to eq(3)
      expect(ll.get_first.data).to eq(8)
      expect(ll.get_first.next.data).to eq(9)
      expect(ll.get_first.next.next.data).to eq(5)
    end
  end

  describe "add last" do
    it "empty ll" do
      ll = LinkedList.new
      ll.add_last(9)
      expect(ll.size).to eq(1)
      expect(ll.get_first.data).to eq(9)
    end

    it "not empty ll" do
      ll = LinkedList.new(5)
      ll.add_last(9)
      expect(ll.size).to eq(2)
      expect(ll.get_first.data).to eq(5)
      expect(ll.get_first.next.data).to eq(9)
    end

    it "three times" do
      ll = LinkedList.new(5)
      ll.add_last(9)
      ll.add_last(8)
      expect(ll.size).to eq(3)
      expect(ll.get_first.data).to eq(5)
      expect(ll.get_first.next.data).to eq(9)
      expect(ll.get_first.next.next.data).to eq(8)
    end
  end

  describe "delete_first" do
    it "empty ll" do
      ll = LinkedList.new
      expect{ ll.delete_first }.to raise_error(LinkedList::LIST_IS_EMPTY)
    end

    it "not empty ll" do
      ll = LinkedList.new(5)
      expect(ll.delete_first).to eq(5)
      expect{ll.delete_first }.to raise_error(LinkedList::LIST_IS_EMPTY)
      expect(ll.size).to eq(0)
    end

    it "three times" do
      ll = LinkedList.new(5)
      ll.add_last(9)
      ll.add_last(8)
      expect(ll.size).to eq(3)
      expect(ll.delete_first).to eq(5)
      expect(ll.delete_first).to eq(9)
      expect(ll.delete_first).to eq(8)
    end
  end

  describe "size" do
    it "empty ll" do
      ll = LinkedList.new
      ll.add_last(9)
      expect(ll.size).to eq(1)
    end

    it "not empty ll" do
      ll = LinkedList.new(5)
      expect(ll.size).to eq(1)
      ll.add_last(9)
      expect(ll.size).to eq(2)
    end

    it "add last" do
      ll = LinkedList.new(5)
      expect(ll.size).to eq(1)
      ll.add_last(9)
      expect(ll.size).to eq(2)
      ll.add_last(8)
      expect(ll.size).to eq(3)
    end

    it "add first" do
      ll = LinkedList.new(5)
      expect(ll.size).to eq(1)
      ll.add_first(9)
      expect(ll.size).to eq(2)
      ll.add_first(8)
      expect(ll.size).to eq(3)
    end

    it "delete_first" do
      ll = LinkedList.new(5)
      ll.add_last(9)
      ll.add_last(8)
      expect(ll.size).to eq(3)
      ll.delete_first
      expect(ll.size).to eq(2)
      ll.delete_first
      expect(ll.size).to eq(1)
      ll.delete_first
      expect(ll.size).to eq(0)
    end
  end

  describe "empty?" do
    it "empty ll" do
      ll = LinkedList.new
      expect(ll.empty?).to eq(true)
    end

    it "not empty ll" do
      ll = LinkedList.new(5)
      expect(ll.empty?).to eq(false)
    end

    it "add last" do
      ll = LinkedList.new
      expect(ll.empty?).to eq(true)
      ll.add_last(9)
      expect(ll.empty?).to eq(false)
    end

    it "add first" do
      ll = LinkedList.new
      expect(ll.empty?).to eq(true)
      ll.add_first(9)
      expect(ll.empty?).to eq(false)
    end

    it "delete_first" do
      ll = LinkedList.new
      expect(ll.empty?).to eq(true)
      ll.add_first(9)
      expect(ll.empty?).to eq(false)
      ll.delete_first
      expect(ll.empty?).to eq(true)
    end
  end
end