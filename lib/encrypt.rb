require 'date'
require './lib/keys'
require './lib/offsets'
require './lib/shifter'
require './lib/enigma'

message = File.open(ARGV[0], "r")

incoming_txt = message.read

encrypted_message = Enigma.new.encrypt(incoming_txt.chomp)

writer = File.open(ARGV[1], "w")

writer.write(encrypted_message[:encryption])

writer.close

puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}."
