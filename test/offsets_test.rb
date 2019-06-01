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

    assert_equal "060119", @offsets.date
  end

  def test_date_squared
    assert_equal [4,1,6,1], @offsets.numbers
  end

  def test_offset_generator
    @offsets.offset_generator

    expected = {"A" => 4, "B" => 1, "C" => 6, "D" => 1}
    assert_equal expected, @offsets.offset_keys
  end

end
