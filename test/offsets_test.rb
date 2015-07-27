require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offsets'

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

end
