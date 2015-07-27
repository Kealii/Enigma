require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offsets'

class OffsetsTest < Minitest::Test

  def test_inits_date
    offset = Offsets.new
    assert_equal offset.date, "010101"
  end

end
