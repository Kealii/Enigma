require 'minitest/autorun'
require 'minitest/pride'
require '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_key_generator_exists
    keygen = KeyGenerator.new
    assert_equal keygen, keygen
  end

  def test_we_can_generate_random_5_digit_number
    skip
    keygen = KeyGenerator.new
    assert_includes (11111..99999), keygen.generate_key
  end

  def test_generate_key_generates_1_number
    keygen = KeyGenerator.new
    keygen.generate_key
    assert_equal 7, keygen.key.to_s.length
  end

end
