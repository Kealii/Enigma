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
    assert_equal "ifmmp", e.encrypt("hello", 1)
  end

  def test_rotator_can_be_called
    e = Enigma.new
    assert_equal [16, 26, 36, 46], e.rotator
  end

end
