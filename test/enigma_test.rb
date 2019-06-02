require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys'
require './lib/offsets'
require './lib/shifter'
require './lib/enigma'
require 'pry'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new("Hello World")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    assert_equal "Hello World", @enigma.message
  end

  def test_it_can_transform_message_to_ordinal_values
    assert_equal [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100], @enigma.transform_message_to_ordinal_values
  end
  
  # def test_it_can_encrypt
  #   assert_equal "hello wolrd", @enigma.encrypt
  # end


end
