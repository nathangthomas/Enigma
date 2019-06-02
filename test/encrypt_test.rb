require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys'
require './lib/offsets'
require './lib/encrypt'
require 'pry'


class EncryptTest < MiniTest::Test
  def setup
    @keys = Keys.new
    @offsets = Offsets.new("060119")
    @keys.random_key_generator
    @offsets.offset_generator

    @encrypt = Encrypt.new(@keys.rand_keys, @offsets.offset_keys)
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_has_attributes
    assert @encrypt.keys.length == 4
    expected = expected = {"A" => 3, "B" => 1, "C" => 6, "D" => 1}
    assert_equal expected, @encrypt.offsets
  end

  def test_encryption_shift_code

    assert_equal 4, @encrypt.encryption_shift_code.length
    #How else can I test this?
  end
end
