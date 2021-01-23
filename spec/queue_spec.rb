require './src/data_structures/queue'

RSpec.describe QueueSized do
  describe "new" do
    it "no max" do
      queue = QueueSized.new
      expect(queue.size).to eq(0)
      expect(queue.capacity).to eq(100)
      expect{ queue.dequeue }.to raise_error(QueueSized::QUEUE_IS_EMPTY)
    end

    it "not empty" do
      queue = QueueSized.new(1000)
      expect(queue.size).to eq(0)
      expect(queue.capacity).to eq(1000)
      expect{ queue.dequeue }.to raise_error(QueueSized::QUEUE_IS_EMPTY)
    end
  end

  describe "enqueue" do
    it "not empty" do
      queue = QueueSized.new(1000)
      queue.enqueue(1)
      expect(queue.size).to eq(1)
      queue.enqueue(2)
      expect(queue.size).to eq(2)
      queue.enqueue(3)
      expect(queue.size).to eq(3)
      queue.enqueue(4)
      expect(queue.size).to eq(4)
    end
  end

  describe "dequeue" do
    it "not empty" do
      queue = QueueSized.new(1000)
      queue.enqueue(1)
      queue.enqueue(2)
      queue.enqueue(3)
      queue.enqueue(4)
      expect(queue.size).to eq(4)
      expect(queue.dequeue).to eq(1)
      expect(queue.size).to eq(3)
      expect(queue.dequeue).to eq(2)
      expect(queue.size).to eq(2)
      expect(queue.dequeue).to eq(3)
      expect(queue.size).to eq(1)
      expect(queue.dequeue).to eq(4)
      expect(queue.size).to eq(0)
      expect{ queue.dequeue }.to raise_error(QueueSized::QUEUE_IS_EMPTY)
    end
  end

  describe "capacity" do
    it "1000" do
      queue = QueueSized.new(1000)
      expect(queue.capacity).to eq(1000)
    end

    it "default" do
      queue = QueueSized.new
      expect(queue.capacity).to eq(100)
    end

    it "10" do
      queue = QueueSized.new(10)
      expect(queue.capacity).to eq(10)
    end

    it "0" do
      queue = QueueSized.new(0)
      expect(queue.capacity).to eq(100)
    end

    it "-20" do
      queue = QueueSized.new(-20)
      expect(queue.capacity).to eq(100)
    end
  end
end