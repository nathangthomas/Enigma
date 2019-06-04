class Enigma
  attr_reader :message

  def initialize
    @message = message
  end

#
  def encrypt(message, key = default_key, date)
    keys = Keys.new(five_digit_number)
    keys_array = keys.generator_four_keys
#     shifter = Shifter.new(keys, offsets)
#     {encryption:
#       key:
#       date:
#     }
   end
#   def decrypt(ciphertext, key, date)
#   #end
#  end
end
