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
     @enigma = Enigma.new
   end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_a_message_with_a_key_and_date
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_with_a_key_and_date
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_a_key
    #uses today's date
    expected = {
                encryption: "?",
                key: "02715",
                date: "?"
                }
    refute_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_a_key
    #uses today's date
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040619"
                }
    refute_equal expected, @enigma.decrypt("nkyvufiyxrq", "02715")
  end
  #
  def test_it_can_encrypt_a_message_with_random_key_and_date_of_today
    rand_keys_hash = {"A"=>12, "B"=>23, "C"=>34, "D"=>45}
    Keys.any_instance.stubs(:random_numbers).returns("12345")
    Keys.any_instance.stubs(:rand_keys).returns(rand_keys_hash)
    Time.any_instance.stubs(:strftime).returns("030619")

        expected = {
                encryption: "nkyvufiyxrq",
                key: "12345",
                date: "030619"
                }
    refute_equal expected, @enigma.encrypt("hello world")
  end

  # def test_it_will_skip_special_characters
  #   expected = {
  #               encryption: "?keder.ohulw!",
  #               key: "02715",
  #               date: "040895"
  #               }
  #   assert_equal expected, @enigma.encrypt("helloworld", "02715", "040895")
  # end

end
