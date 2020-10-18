class Flag
  DEFAULT_ZERO = 0b0
  F1 = 0b01   # 1
  F2 = 0b10   # 2
  F3 = 0b100  # 4
end

class FlagConverter
    def initialize(descriptor=0)
      @descriptor = descriptor
    end

    def set_flag(val)
      @descriptor |= val
    end

    def remove_flag(val)
      return @descriptor if @descriptor == Flag::DEFAULT_ZERO

      if self.has_flag(val)
        return @descriptor ^= val
      end

      @descriptor
    end

    def has_flag(val)
        # Since DEFAULT_ZERO isn't a flag (it is the absence of flags)
      return @descriptor == val if val == Flag::DEFAULT_ZERO
      @descriptor & val == val
    end
end
