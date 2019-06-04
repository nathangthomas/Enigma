class Shifter
  attr_reader :keys, :offsets, :shift_code
  def initialize(keys, offsets)
    @keys = keys
    @offsets = offsets
  end

  def shift_code
   @keys.merge(@offsets) do |key, rand_key, offset_key|
      rand_key + offset_key
    end
  end
end
