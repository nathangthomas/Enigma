class Enigma
  attr_reader :message, :date, :key, :shift_code

  def initialize(shift_code)
    @shift_code = shift_code
    @message = message
    @keys = Keys.new.random_number_generator
    @date = Time.now.strftime("%d%m%y")
  end

  def encrypt(message, key = @keys, date = @date)

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
    {encryption: encrypted_message, key: key, date: date}
  end

  def decrypt(ciphertext, key = @keys, date = @date)
    ciphertext_to_array = ciphertext.chars
    decrypted_message = ""
    alphabet = ("a".."z").to_a << " "
    interval = shift_code.keys.length

    reverse_shift_code = Hash.new{0}
    shift_code.each do |key, value|
      reverse_shift_code[key] = value * -1
    end

    ciphertext_to_array.each_with_index do |letter, index|
      keys_array = shift_code.keys
      current_key = keys_array[index % interval]
      decrypt_array = alphabet.rotate(reverse_shift_code[current_key])
      decrypted_message << decrypt_array[alphabet.index(letter)]
    end
    {decryption: decrypted_message, key: key, date: date}
  end
end
