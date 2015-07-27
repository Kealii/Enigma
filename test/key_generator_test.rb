require 'minitest/autorun'
require 'minitest/pride'
require '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_key_generator_exists
    keygen = KeyGenerator.new
    assert_equal keygen, keygen
  end

  def test_we_can_generate_random_5_digit_number
    keygen = KeyGenerator.new
    assert_includes (11111..99999), keygen.generate_key.to_i
  end

  def test_finds_akey
    keygen = KeyGenerator.new
    assert_equal 12, keygen.a_key
  end

  def test_finds_bkey
    keygen = KeyGenerator.new
    assert_equal 23, keygen.b_key
  end

  def test_finds_ckey
    keygen = KeyGenerator.new
    assert_equal 34, keygen.c_key
  end

  def test_finds_dkey
    keygen = KeyGenerator.new
    assert_equal 45, keygen.d_key
  end

end
