require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/keys'
require './lib/offsets'
require './lib/shifter'
require 'pry'


class ShifterTest < MiniTest::Test
  def setup
    @keys = Keys.new
    @offsets = Offsets.new("010619")
    @keys.random_key_generator
    @offsets.offset_generator

    @shifter = Shifter.new(@keys.rand_keys, @offsets.offset_keys)
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_it_has_attributes
    assert @shifter.keys.length == 4
    expected = {"A" => 3, "B" => 1, "C" => 6, "D" => 1}
    assert_equal expected, @shifter.offsets
  end

  def test_shift_code
    assert_equal 4, @shifter.shift_code.length
    #How else can I test this?
  end

  def test_it_can_shift
    assert_equal 0, @shifter.shift("Hello World")
  end

  def test_it_can_unshift
    assert_equal 0, @shifter.unshift(@shifter.shift("Hello World"))
    #Last two tests and the code in shifter that goes with it belongs in enigma since encrypt and decrypt are supposed to live there.
  end
end
