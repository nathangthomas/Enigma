class Shifter
  attr_reader :keys, :offsets
  def initialize(keys, offsets)
    @keys = keys
    @offsets = offsets
  end

  def shift_code
    shift_code = @keys.merge(@offsets) do |key, rand_key, offset_key|
      rand_key + offset_key
    end
  shift_code
  end

end
