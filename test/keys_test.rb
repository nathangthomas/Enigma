require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/keys'
require 'pry'

class KeysTest < MiniTest::Test
  def setup
    @keys = Keys.new
  end

  def test_it_exists
    assert_instance_of Keys, @keys
  end

  def test_it_has_attributes
    expected = {}
    assert_equal expected, @keys.rand_keys
  end

  def test_random_number_generator
    @keys.random_number_generator

    assert_equal 5, @keys.random_numbers.length

    @keys.random_numbers.each do |random_number|
    assert random_number < 10
    end
  end

  def test_it_can_take_five_numbers_as_optional_parameter
    @keys_2 = Keys.new(12345)
    @keys_2.random_number_generator

    assert_equal [1,2,3,4,5], @keys_2.random_numbers
  end

  def test_key_generator
    @keys.random_number_generator
    @keys.key_generator

    assert_equal 4, @keys.rand_keys.length
  end

  def test_the_keys_returns_4_valid_keys
    @keys.random_number_generator
    @keys.key_generator

    assert_equal 4, @keys.rand_keys.length
  end
end
