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

  def unshift(encrypted_message)
    encrypted_message_to_array = encrypted_message.chars
    message = ""
    alphabet = ("a".."z").to_a << " "
    interval = shift_code.keys.length

    reverse_shift_code = shift_code.each{|key, value| value * -1}

    encrypted_message_to_array.each_with_index do |letter, index|
      keys_array = shift_code.keys
      current_key = keys_array[index % interval]
      unshift_array = alphabet.rotate(shift_code[current_key])
      message << unshift_array[alphabet.index(letter)]
    end
    message
  end
end
