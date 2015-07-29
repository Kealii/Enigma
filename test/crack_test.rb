require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/crack'

class CrackTest < Minitest::Test

  def test_initializes_with_zero_as_key
    crack = Crack.new
    assert_equal 0, crack.crack_key
  end

  def test_formats_keys
    crack = Crack.new
    rotate = crack.format_key
    assert_equal "00000", rotate
  end


end
