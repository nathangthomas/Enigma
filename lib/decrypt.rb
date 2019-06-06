require 'date'
require './lib/keys'
require './lib/offsets'
require './lib/shifter'
require './lib/enigma'

encrypted_message = File.open(ARGV[0], "r")

decrypted_message = Enigma.new.decrypt(encrypted_message.read, ARGV[2], ARGV[3])

decrypted = File.open(ARGV[1], "w")
decrypted.write(decrypted_message[:decryption])

p "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
