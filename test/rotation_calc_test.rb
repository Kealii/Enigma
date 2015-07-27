require 'minitest/autorun'
require 'minitest/pride'
require '../lib/Rotation_calc'

class Rotation_calcTest < Minitest::Test

  def test_adds_arotation
    calc = Rotation_calc.new
    assert_equal 16, calc.a_rotation
  end

end
