require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/keys'
require './lib/offsets'
require './lib/shifter'
require 'date'
require './lib/enigma'
require 'pry'

class EnigmaTest < MiniTest::Test
  def setup
    @keys = Keys.new
    @offsets = Offsets.new("010619")
    @keys.random_key_generator
    @offsets.offset_generator

    @shifter = Shifter.new(@keys.rand_keys, @offsets.offset_keys)

    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_encrypts
    expected =
    assert_equal expected, enigma.encrypt("hello world", "02715", "010619")
  end

  # def test_it_has_attributes
  #   assert_equal "Hello World", @enigma.message
  # end

  # def test_it_can_encrypt
    #expected = {encryption:"?", key:?, date: "02715"}
  #   assert_equal "hello wolrd", @enigma.encrypt
  # end

  # def test_it_can_decrypt
  #   expected = {decryption:"?", key:?, date: "02715"}
  #     assert_equal "?", @enigma.decrypt
  # end
end
