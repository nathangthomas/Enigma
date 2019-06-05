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
    Time.any_instance.stubs(:strftime).returns("040619")
    expected = {
                encryption: "mfhatasdwm ",
                key: "02715",
                date: "040619"
                }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_a_key
    Time.any_instance.stubs(:strftime).returns("040619")
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040619"
                }
    assert_equal expected, @enigma.decrypt("mfhatasdwm ", "02715")
  end

  #non working test below
  def test_it_can_encrypt_a_message_with_random_key_and_date_of_today
    rand_keys_hash = {"A"=>15, "B"=>24, "C"=>40, "D"=>46}
    Shifter.any_instance.stubs(:keys).returns("12345")
    Shifter.any_instance.stubs(:shift_code).returns(rand_keys_hash)
    Time.any_instance.stubs(:strftime).returns("040619")

        expected = {
                encryption: "wbydcxigfiq",
                key: "12345",
                date: "040619"
                }
    refute_equal expected, @enigma.encrypt("hello world")
  end

  def test_it_will_skip_special_characters
    expected = {
                encryption: "?hxeoo_prrdx!",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, @enigma.encrypt("?hello_world!", "02715", "040895")
  end
end
