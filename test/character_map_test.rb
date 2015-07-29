require 'minitest/autorun'
require 'minitest/pride'
require '../lib/character_map'

class CharacterMapTest < Minitest::Test
  
  def test_a_is_first_character_of_map
    map = CharacterMap.new(0)
    assert_equal "a", map.cipher['a']
  end

  def test_1_rotation_shifts_cipher
    map = CharacterMap.new(1)
    assert_equal 'b', map.cipher['a']
  end

  def test_0_is_26th_rotation
    map = CharacterMap.new(26)
    assert_equal 0, map.cipher['a']
  end

  def test_period_is_37th_rotation
    map = CharacterMap.new(37)
    assert_equal ".", map.cipher['a']
  end

  def test_39th_rotation_is_back_to_a
    map = CharacterMap.new(39)
    assert_equal 'a', map.cipher['a']
  end
end
