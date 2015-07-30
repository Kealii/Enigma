require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/crack'

class CrackTest < Minitest::Test

  def test_initializes_with_zero_as_key
    crack = Crack.new
    assert_equal [0, 0, 0, 0, 0], crack.key
  end

  def test_rotations_are_array
    crack = Crack.new
    crack.cracker
    assert_equal Array, crack.final_rotations.class
  end


  def test_we_offset_key
    crack = Crack.new
    crack.cracker
    assert_equal true, crack.cracked?
  end

end
