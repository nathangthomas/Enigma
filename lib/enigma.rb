class Enigma
#get rid of this number_generator for a 3 
  def number_generator
    num_array = ""
    5.times{num_array << rand(10).to_s}
    num_array
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def encrypt(message, key = number_generator, date = Time.now.strftime("%d%m%y"))
    key_hash = Keys.new(key)
    offset_hash = Offsets.new(date)
    shift = Shifter.new(key_hash.rand_keys, offset_hash.offset_keys).shift_code
    # final_message = Rotation.new(message,shift).
    message_to_array = message.downcase.chars
    encrypted_message = ""
    interval = shift.keys.length

    message_to_array.each_with_index do |letter, index|
      if alphabet.include?(letter)
        keys_array = shift.keys
        current_key = keys_array[index % interval]
        shift_array = alphabet.rotate(shift[current_key])
        encrypted_message << shift_array[alphabet.index(letter)]
      else
        encrypted_message << letter
      end
    end
    {encryption: encrypted_message, key: key, date: date}
  end

  def decrypt(ciphertext, key = number_generator, date = Time.now.strftime("%d%m%y"))

    key_hash = Keys.new(key)
    offset_hash = Offsets.new(date)
    shift = Shifter.new(key_hash.rand_keys, offset_hash.offset_keys).shift_code

    ciphertext_to_array = ciphertext.chars
    decrypted_message = ""
    interval = shift.keys.length

    reverse_shift = Hash.new{0}
    shift.each do |key, value|
      reverse_shift[key] = value * -1
    end

    ciphertext_to_array.each_with_index do |letter, index|
      if alphabet.include?(letter)
        keys_array = reverse_shift.keys
        current_key = keys_array[index % interval]
        decrypt_array = alphabet.rotate(reverse_shift[current_key])
        decrypted_message << decrypt_array[alphabet.index(letter)]
      else
        decrypted_message << letter
      end
    end
    {decryption: decrypted_message, key: key, date: date}
  end
end
