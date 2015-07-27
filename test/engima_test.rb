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

  def test_we_can_encrypt_string
    e = Enigma.new
    assert_equal "hello", e.encrypt("hello", 0)
  end

end
