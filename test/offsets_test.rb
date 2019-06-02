require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys'
require './lib/offsets'
require 'date'
require 'pry'

class OffsetsTest < MiniTest::Test
  def setup
    @offsets = Offsets.new("060119")
  end

  def test_it_exists
    assert_instance_of Offsets, @offsets
  end

  def test_it_has_attributes
    assert_equal "010619", @offsets.date
  end

  def test_sqaure_date
    assert_equal 112763161, @offsets.date_squared
  end

  def test_returns_array_of_the_last_4_digits_of_squared_date
    assert_equal [3,1,6,1], @offsets.numbers
  end
  def test_offset_generator
    @offsets.offset_generator

    expected = {"A" => 3, "B" => 1, "C" => 6, "D" => 1}
    assert_equal expected, @offsets.offset_keys
  end

end
