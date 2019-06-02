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
end
