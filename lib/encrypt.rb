class Encrypt
  attr_reader :keys, :offsets
  def initialize(keys, offsets)
    @keys = keys
    @offsets = offsets
  end

  def encryption_shift_code
    encryption_code = @keys.merge(@offsets) do |key, rand_key, offset_key|
      rand_key + offset_key
    end
  encryption_code
  end

  def encrypt_message
    character_set = ("a".."z").to_a << " "
  end
end
