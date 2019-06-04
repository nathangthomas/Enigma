require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'date'
require './lib/keys'
require './lib/offsets'
require './lib/shifter'
require './lib/enigma'
require 'pry'

class EnigmaTest < MiniTest::Test
   def setup
     @keys = Keys.new("12345")
     @keys.key_generator
     @offsets = Offsets.new("040619")
     @offsets.offset_generator

     @shifter = Shifter.new(@keys.rand_keys, @offsets.offset_keys)

     @enigma = Enigma.new(@shifter.shift_code)
   end

  def test_it_exists

    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_a_message_with_a_key_and_date

    @keys = Keys.new("12345")
    @keys.key_generator
    @offsets = Offsets.new("040619")
    @offsets.offset_generator
    @shifter = Shifter.new(@keys.rand_keys, @offsets.offset_keys)
    @enigma = Enigma.new(@shifter.shift_code)

    expected = {
                encryption: "nkyvufiyxrq",
                key: "12345",
                date: "040619"
                }
    assert_equal expected, @enigma.encrypt("hello world", "12345", "040619")
  end

  # def test_it_can_decrypt_a_message_with_a_key_and_date
  #   expected = {
  #               decryption: "hello world",
  #               key: "12345",
  #               date: "040619"
  #               }
  #   assert_equal expected, @enigma.decrypt("nkyvufiyxrq", "12345", "040619")
  # end
  #
  # def test_it_can_encrypt_a_message_with_a_key
  #   #uses today's date
  #   expected = {
  #               encryption: "nkyvufiyxrq",
  #               key: "12345",
  #               date: "040619"
  #               }
  #   assert_equal expected, @enigma.encrypt("hello world", "12345")
  # end
  #
  # def test_it_can_decrypt_a_message_with_a_key
  #   #uses today's date
  #   expected = {
  #               decryption: "hello world",
  #               key: "12345",
  #               date: "040619"
  #               }
  #   assert_equal expected, @enigma.decrypt("nkyvufiyxrq", "12345")
  # end
  #
  # def test_it_can_encrypt_a_message_with_random_key_and_date_of_today
  #   expected = {
  #               encryption: "nkyvufiyxrq",
  #               key: "12345",
  #               date: "040619"
  #               }
  #   assert_equal expected, @enigma.encrypt("hello world")
  # end
end
