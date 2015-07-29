require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/crack'

class CrackTest < Minitest::Test

  def test_initializes_with_zero_as_key
    crack = Crack.new
    assert_equal [0, 0, 0, 0, 0], crack.key
  end

<<<<<<< Updated upstream
  def test_formats_keys
    skip
    crack = Crack.new
    rotate = crack.format_key
    assert_equal "00000", rotate
  end

  def test_we_can_encrypt_string_with_rotation
    crack = Crack.new
    crack.cracker
    assert_equal "igopp", crack.results
  end
=======
>>>>>>> Stashed changes
end
