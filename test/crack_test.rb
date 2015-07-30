require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/crack'

class CrackTest < Minitest::Test

  def test_initializes_with_zero_as_key
    crack = Crack.new
    assert_equal [0, 0, 0, 0, 0], crack.key
  end

  def test_splits_and_adds_one
    crack = Crack.new
    crack.cracker
    assert_equal "00001", crack.key
  end

  def test_rotations_are_array
    crack = Crack.new
    crack.cracker
    assert_equal Array, crack.rotations.class
  end

  def test_can_take_message
    crack = Crack.new
    assert_equal "8.4ymnqx845j7n", crack.message
  end

end
