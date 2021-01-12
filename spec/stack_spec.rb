require './src/data_structures/stack'

RSpec.describe Stack do
  describe "new" do
    it "empty" do
      stack = Stack.new
      expect(stack.size).to eq(0)
      expect{ stack.pop }.to raise_error(Stack::STACK_IS_EMPTY)
    end

    it "not empty" do
      ll = LinkedList.new(5)
      expect(ll.size).to eq(1)
      expect(ll.get_first.data).to eq(5)
    end
  end

  describe "pop" do
    it "empty" do
      stack = Stack.new
      stack.push(9)
      expect(stack.pop).to eq(9)
      expect{ stack.pop }.to raise_error(Stack::STACK_IS_EMPTY)
    end

    it "not empty" do
      stack = Stack.new(5)
      stack.push(9)
      expect(stack.pop).to eq(9)
      expect(stack.pop).to eq(5)
      expect{ stack.pop }.to raise_error(Stack::STACK_IS_EMPTY)
    end
  end

  describe "size" do
    it "empty" do
      stack = Stack.new
      stack.push(9)
      expect(stack.size).to eq(1)
    end

    it "not empty ll" do
      stack = Stack.new(5)
      expect(stack.size).to eq(1)
      stack.push(9)
      expect(stack.size).to eq(2)
    end

    it "push" do
      stack = Stack.new(5)
      expect(stack.size).to eq(1)
      stack.push(9)
      expect(stack.size).to eq(2)
      stack.push(8)
      expect(stack.size).to eq(3)
    end

    it "pop" do
      stack = Stack.new(5)
      stack.push(9)
      stack.push(8)
      expect(stack.size).to eq(3)
      stack.pop
      expect(stack.size).to eq(2)
      stack.pop
      expect(stack.size).to eq(1)
    end
  end

  describe "empty?" do
    it "empty ll" do
      stack = Stack.new
      expect(stack.empty?).to eq(true)
    end

    it "not empty ll" do
      stack = Stack.new(5)
      expect(stack.empty?).to eq(false)
    end

    it "push" do
      stack = Stack.new
      expect(stack.empty?).to eq(true)
      stack.push(9)
      expect(stack.empty?).to eq(false)
    end

    it "pop" do
      stack = Stack.new(5)
      expect(stack.empty?).to eq(false)
      stack.pop
      expect(stack.empty?).to eq(true)
    end
  end
end
