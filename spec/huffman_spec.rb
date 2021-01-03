require './src/huffman/codes'

RSpec.describe Huff do
  describe "build" do
    before(:each) do
      @hf = Huff.new
    end

    it "string" do
      expect(@hf.run_text('aaaaasssddd')).to eq('11111010101000000')
    end

    it "file" do
      expect(@hf.run_file('./src/huffman/test1.txt')).to eq('11111010101000000')
    end

    it "file is not exist" do
      hf = Huff.new
      expect{ hf.run_file('./src/huffman/test2.txt') }.to raise_error(Huff::FILE_IS_NOT_EXIST)
    end
  end
end