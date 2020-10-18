require './src/bitwise/operations'

RSpec.describe FlagConverter do
  it "Empty" do
    converter = FlagConverter.new
    expect(converter.has_flag(Flag::F1)).to eq(false)
    expect(converter.has_flag(Flag::F2)).to eq(false)
    expect(converter.has_flag(Flag::F3)).to eq(false)
  end

  it "Has Flag" do
    converter = FlagConverter.new(Flag::F1)
    expect(converter.has_flag(Flag::F1)).to eq(true)
    expect(converter.has_flag(Flag::F2)).to eq(false)
    expect(converter.has_flag(Flag::F3)).to eq(false)
  end

  it "Set Flag" do
    converter = FlagConverter.new
    expect(converter.has_flag(Flag::F2)).to eq(false)
    converter.set_flag(Flag::F2)
    expect(converter.has_flag(Flag::F1)).to eq(false)
    expect(converter.has_flag(Flag::F2)).to eq(true)
    expect(converter.has_flag(Flag::F3)).to eq(false)
  end

  it "Remove Flag" do
    converter = FlagConverter.new(Flag::F3)
    expect(converter.has_flag(Flag::F3)).to eq(true)
    expect(converter.has_flag(Flag::F1)).to eq(false)
    expect(converter.has_flag(Flag::F2)).to eq(false)
    converter.remove_flag(Flag::F3)
    expect(converter.has_flag(Flag::F3)).to eq(false)
    expect(converter.has_flag(Flag::F1)).to eq(false)
    expect(converter.has_flag(Flag::F2)).to eq(false)
  end
end
