require 'date'
require './lib/keys'
require './lib/offsets'
require './lib/shifter'
require './lib/enigma'

encrypted, decrypted, key, date = ARGV

encrypted_message = File.open(encrypted, "r")

decrypted = File.open(decrypted, "w")

encrypted_message = Enigma.new.decrypt(encrypted_message.read, key, date)

decrypted.write(encrypted_message[:decryption])

decrypted.close

p "Created #{decrypted} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
