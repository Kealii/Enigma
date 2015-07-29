require 'minitest/autorun'
require 'minitest/pride'
require '../lib/enigma'
# require '../files/message.txt'
# require '../files/encrypted.txt'

class EnigmaTest < Minitest::Test
  def test_we_can_read_input
    e = Enigma.new
    e.collect_message
    e.output_message
    assert_equal "test test test\n", e.message
  end

  def test_we_can_write_output
    e = Enigma.new
    e.collect_message
    e.output_message
    assert_equal "test test test\n", e.final_message
  end

  def test_we_can_pass_string
    e = Enigma.new
    assert_equal "hello", e.encrypt("hello", 0)
  end

  def test_we_can_encrypt_string_with_rotation
    e = Enigma.new
    assert_equal "igopp", e.encrypt("hello", [1, 2, 3, 4])
  end

  def test_we_can_decrypt_string_with_rotation
    e = Enigma.new
    assert_equal "hello", e.decrypt("igopp", [1, 2, 3, 4])
  end

  def test_offsets_and_date_adding_to_rotate
    e = Enigma.new
    assert_equal [16, 26, 36, 46], e.final_offsets
  end

  def test_we_can_grab_rotation_and_encrypt
    e = Enigma.new
    assert_equal "x4is4", e.encrypt("hello")
  end

end
