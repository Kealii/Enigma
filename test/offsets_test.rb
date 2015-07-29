require 'minitest/autorun'
require 'minitest/pride'
require '../lib/offsets'

class OffsetsTest < Minitest::Test

  def test_inits_date
    offset = Offsets.new
    assert_equal offset.date, "111111"
  end

  def test_pulls_date
    offset = Offsets.new
    date_test = offset.offset_date
    assert_equal date_test, Time.now.strftime("%d%m%y")
  end

  def test_squares_date
    offset = Offsets.new
    square = offset.square_date
    assert_equal square, 12345654321
  end

  def test_extracts_last_four_digits
    offset = Offsets.new
    assert_equal [4,3,2,1], offset.extract_date_key
  end

  def test_adds_a_rotations
    offset = Offsets.new
    assert_equal 16, offset.a_rotations
  end

  def test_adds_b_rotations
    offset = Offsets.new
    assert_equal 26, offset.b_rotations
  end

  def test_adds_c_rotations
    offset = Offsets.new
    assert_equal 36, offset.c_rotations
  end

  def test_adds_d_rotations
    offset = Offsets.new
    assert_equal 46, offset.d_rotations
  end

  def test_we_can_call_master_rotation
    offset = Offsets.new
    offset.extract_date_key
    assert_equal [16, 26, 36, 46], offset.master_rotations
  end

end
