class Shifter
  attr_reader :keys, :offsets
  def initialize(keys, offsets)
    @keys = keys
    @offsets = offsets
  end

  def shift_code
   @keys.merge(@offsets) do |key, rand_key, offset_key|
      rand_key + offset_key
    end

  end

  def shift(message)
    message_to_array = message.downcase.chars
    encrypted_message = ""
    alphabet = ("a".."z").to_a << " "
    interval = shift_code.keys.length

    message_to_array.each_with_index do |letter, index|
      keys_array = shift_code.keys
      current_key = keys_array[index % interval]
      shift_array = alphabet.rotate(shift_code[current_key])
      encrypted_message << shift_array[alphabet.index(letter)]
    end
  encrypted_message
  end

end
