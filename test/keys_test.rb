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
    @keys_1 = Keys.new
  end

  def test_it_exists
    assert_instance_of Keys, @keys_1
  end

  def test_it_has_attributes
    @keys_2 = Keys.new("12345")
    assert_equal "12345", @keys_2.random_numbers
    expected = {"A"=>12, "B"=>23, "C"=>34, "D"=>45}
    assert_equal expected, @keys_2.rand_keys
  end
  
  def test_number_generator
    @keys_1.number_generator

    assert_equal 5, @keys_1.random_numbers.length

    @keys_1.random_numbers.split(//).each do |random_number|
    assert random_number.to_i < 10
    end
  end

  def test_case_name
    Keys.any_instance.stubs(:random_numbers).returns("12345")
    assert_equal "12345", @keys_1.random_numbers
  end

  def test_it_can_take_five_numbers_as_optional_parameter
    @keys_2 = Keys.new("12345")
    @keys_2.number_generator

    assert_equal "12345", @keys_2.random_numbers
  end

  def test_key_generator
    @keys_1.number_generator
    @keys_1.key_generator

    assert_equal 4, @keys_1.rand_keys.length
  end
end
