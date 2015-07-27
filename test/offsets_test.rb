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
    offset = Offsets.new("111111")
    square = offset.square_date
    assert_equal square, 12345654321
  end

  def test_extracts_last_four_digits
    offset = Offsets.new("111111")
    test_key = offset.extract_date_key
    assert_equal test_key, [4, 3, 2, 1]
  end

  def test_adds_arotations
    offset = Offsets.new
    offset.extract_date_key
    assert_equal 16, offset.a_rotations
  end

  def test_adds_brotations
    offset = Offsets.new
    offset.extract_date_key
    assert_equal 26, offset.b_rotations
  end

  def test_adds_arotations
    offset = Offsets.new
    offset.extract_date_key
    assert_equal 36, offset.c_rotations
  end

  def test_adds_drotations
    offset = Offsets.new
    offset.extract_date_key
    assert_equal 46, offset.d_rotations
  end


end
