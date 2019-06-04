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
require 'pry'


class ShifterTest < MiniTest::Test
  def setup
    @keys = Keys.new("12345")
    @offsets = Offsets.new("010619")

    @keys.key_generator
    @offsets.offset_generator

    @shifter = Shifter.new(@keys.rand_keys, @offsets.offset_keys)
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_it_has_attributes
    assert @shifter.keys.length == 4
    expected = {"A" => 3, "B" => 1, "C" =>6, "D" =>1}
    assert_equal expected, @shifter.offsets
  end

  def test_shift_code
    assert_equal 4, @shifter.shift_code.length
    expected = {"A"=>15, "B"=>24, "C"=>40, "D"=>46}
    assert_equal expected, @shifter.shift_code
  end

  def test_returns_shifter_keys_with_no_parameters
    #need to stub this test out. expected is different each time this is run.
    @shifter_1 = Shifter.new(Keys.new.rand_keys, Offsets.new.offset_keys)

    expected = {"A"=>73, "B"=>1, "C"=>7, "D"=>18}

    assert_equal 4, @shifter_1.shift_code.keys.length
    assert_equal 4, @shifter_1.shift_code.values.length
    assert @shifter_1.shift_code
  end
end
