require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_we_can_read_input
    e = Encryptor.new
    assert_equal "test test test\n", e.message
  end

  def test_we_can_pass_string
    e = Encryptor.new
    assert_equal "hello", e.encrypt("hello", 0)
  end

  def test_we_can_encrypt_string_with_rotation
    e = Encryptor.new
    assert_equal "igopp", e.encrypt("hello", [1, 2, 3, 4])
  end

  def test_offsets_and_date_adding_to_rotate
    e = Encryptor.new
    assert_equal [16, 26, 36, 46], e.final_rotations
  end

  def test_we_can_grab_rotation_and_encrypt
    e = Encryptor.new
    assert_equal "x4is4", e.encrypt("hello")
  end

  def test_we_can_pass_in_string_to_encrypt
    e = Encryptor.new
    assert_equal "94p0ngbz9xql8g", e.final_message
  end

end
